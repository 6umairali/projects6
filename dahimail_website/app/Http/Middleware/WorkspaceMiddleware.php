<?php

namespace App\Http\Middleware;

use App\Models\Workspace;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class WorkspaceMiddleware
{
    /**
     * Set the active workspace context from the authenticated user.
     *
     * Makes the workspace available via:
     *   - $request->attributes->get('workspace')
     *   - $request->workspace() (via macro)
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();

        if (!$user) {
            abort(401, 'Authentication required.');
        }

        // Check admin impersonation timeout (10 minutes max — tightened from 30)
        if ($request->session()->has('admin_impersonation_expires_at')) {
            $expiresAt = $request->session()->get('admin_impersonation_expires_at');
            if (now()->timestamp > $expiresAt) {
                $request->session()->forget(['admin_impersonating', 'admin_impersonating_name', 'admin_impersonation_expires_at']);
                auth()->guard('web')->logout();
                return redirect(url('/admin/dashboard'))->with('warning', 'Impersonation session expired.');
            }
        }

        // FIX-007: Only assign workspaces the user is actually a member of
        if (!$user->active_workspace_id) {
            $firstWorkspace = $user->workspaces()
                ->wherePivotIn('role', ['owner', 'admin', 'agent', 'viewer'])
                ->first();

            if ($firstWorkspace) {
                $user->update(['active_workspace_id' => $firstWorkspace->id]);
            } else {
                if (!$request->is('onboarding*')) {
                    return redirect()->route('onboarding.step-1');
                }
                return $next($request);
            }
        }

        // Use cache to avoid DB queries on every request (cache per user, 60s TTL)
        $cacheKey = "workspace:{$user->id}:{$user->active_workspace_id}";
        $cached = cache()->get($cacheKey);

        if ($cached) {
            $request->attributes->set('workspace', $cached['workspace']);
            $request->attributes->set('workspace_role', $cached['role']);
            return $next($request);
        }

        // Single query: find workspace AND verify membership in one go
        $membership = $user->workspaces()
            ->where('workspaces.id', $user->active_workspace_id)
            ->first();

        if (!$membership) {
            $fallback = $user->workspaces()->wherePivot('status', 'active')->first();

            if ($fallback) {
                $user->update(['active_workspace_id' => $fallback->id]);
                $membership = $fallback;
            } else {
                abort(403, 'You do not belong to any workspace.');
            }
        }

        $workspace = Workspace::find($membership->id);

        if (!$workspace) {
            abort(403, 'Your active workspace could not be found.');
        }

        $role = $membership->pivot?->role ?? 'member';

        // Cache for 15 seconds — short TTL so role changes propagate quickly (MN-005)
        cache()->put($cacheKey, ['workspace' => $workspace, 'role' => $role], 15);

        $request->attributes->set('workspace', $workspace);
        $request->attributes->set('workspace_role', $role);

        return $next($request);
    }
}
