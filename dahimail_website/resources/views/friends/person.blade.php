<x-layouts.app :title="$p['name']">
    <div class="max-w-3xl mx-auto space-y-6" data-person data-user-id="{{ $p['id'] }}" data-name="{{ $p['name'] }}">
        <a href="{{ url('/people') }}" class="text-sm text-muted hover:text-ink">&larr; {{ __('Friends') }}</a>

        {{-- header --}}
        <div class="bg-surface-2 rounded-2xl border border-border p-6 flex flex-wrap items-center gap-5">
            <div class="w-24 h-24 rounded-full bg-brand/10 text-brand flex items-center justify-center text-3xl font-semibold overflow-hidden flex-shrink-0">
                @if($p['avatar_url'])<img src="{{ $p['avatar_url'] }}" alt="{{ $p['name'] }}" class="w-full h-full object-cover">@else{{ strtoupper(mb_substr($p['name'], 0, 1)) }}@endif
            </div>
            <div class="min-w-0 flex-1">
                <h1 class="text-2xl font-semibold text-ink truncate">{{ $p['name'] }}</h1>
                @if($p['username'])<div class="text-sm text-muted">{{ $p['username'] }}</div>@endif
                <div class="flex flex-wrap gap-2 mt-2">
                    @if($p['is_friend'])<span class="text-xs rounded-full bg-green-100 text-green-800 px-2.5 py-0.5">{{ __('Friend') }}</span>@endif
                    @if(!empty($p['is_former']))<span class="text-xs rounded-full bg-gray-200 text-gray-700 px-2.5 py-0.5">{{ __('Unfriended') }}@if($p['unfriended_on']) · {{ $p['unfriended_on'] }}@endif</span>@endif
                    @if($p['is_team'])<span class="text-xs rounded-full bg-blue-100 text-blue-800 px-2.5 py-0.5">{{ __('Team') }}@if(!empty($p['team']['role'])) · {{ $p['team']['role'] }}@endif</span>@endif
                </div>
            </div>
        </div>

        {{-- ways to reach --}}
        @if($p['is_friend'] || $p['is_team'])
            <div class="flex flex-wrap gap-3">
                @if(\App\Support\FriendSettings::chatEnabled())
                    <a href="{{ $p['chat_url'] }}" class="btn-primary" title="{{ __('Chat') }}" aria-label="{{ __('Chat') }}"><x-action-icon name="chat" />@if(($p['unread'] ?? 0) > 0)<span class="ml-1 text-xs rounded-full bg-white/25 px-1.5 py-0.5">{{ $p['unread'] }}</span>@endif</a>
                @endif
                @if(\App\Support\FriendSettings::callsEnabled())
                    <button type="button" onclick="window.FriendCall && window.FriendCall.start({{ $p['id'] }}, @js($p['name']))" class="btn-secondary" title="{{ __('Audio call') }}" aria-label="{{ __('Audio call') }}"><x-action-icon name="phone" /></button>
                    <button type="button" onclick="window.FriendCall && window.FriendCall.startVideo({{ $p['id'] }}, @js($p['name']))" class="btn-secondary" title="{{ __('Video call') }}" aria-label="{{ __('Video call') }}"><x-action-icon name="video" /></button>
                @endif
                <a href="{{ url('/meetings') }}" class="btn-secondary" title="{{ __('Meetings') }}" aria-label="{{ __('Meetings') }}"><x-action-icon name="calendar" /></a>
                <a href="mailto:{{ $p['email'] }}" class="btn-secondary" title="{{ __('Email') }}" aria-label="{{ __('Email') }}"><x-action-icon name="mail" /></a>
            </div>
        @else
            <div class="flex flex-wrap gap-3">
                @if(!empty($p['is_former']) && \App\Support\FriendSettings::chatEnabled())<a href="{{ $p['chat_url'] }}" class="btn-primary" title="{{ __('Open chat history') }}" aria-label="{{ __('Open chat history') }}"><x-action-icon name="chat" /></a>@endif
                <a href="mailto:{{ $p['email'] }}" class="btn-secondary" title="{{ __('Email') }}" aria-label="{{ __('Email') }}"><x-action-icon name="mail" /></a>
            </div>
        @endif

        {{-- details --}}
        <div class="bg-surface-2 rounded-2xl border border-border p-6">
            <h2 class="text-base font-semibold text-ink mb-3">{{ __('Details') }}</h2>
            @php
            $rows = array_filter([
                [__('Email'), $p['email']],
                [__('Username'), $p['username'] ? $p['username'] : null],
                [__('Member since'), $p['member_since']],
                [__('Friends since'), $p['friend_since']],
                [__('Role in your workspace'), $p['team']['role'] ?? null],
                [__('Last active'), $p['team']['last_active'] ?? null],
                [__('Local time'), $p['local_time'] ? $p['local_time'] . ($p['timezone'] ? ' (' . $p['timezone'] . ')' : '') : null],
                [__('Language'), $p['language']],
            ], fn ($r) => !empty($r[1]));
            @endphp
            <dl class="divide-y divide-border">
                @foreach($rows as [$label, $value])
                    <div class="py-2.5 flex items-center justify-between gap-4" x-data="{ copied: false }">
                        <dt class="text-sm text-muted">{{ $label }}</dt>
                        <dd class="text-sm font-medium text-ink text-right break-all">
                            {{ $value }}
                            @if($label === __('Email'))<button type="button" class="ml-2 text-xs text-brand hover:underline" @click="navigator.clipboard.writeText(@js($value)); copied = true; setTimeout(() => copied = false, 1500)"><span x-show="!copied">{{ __('Copy') }}</span><span x-show="copied" x-cloak>{{ __('Copied') }}</span></button>@endif
                        </dd>
                    </div>
                @endforeach
            </dl>
        </div>

        {{-- friendship timeline: requested / became friends / unfriended, with dates --}}
        @if(!empty($p['history']))
            <div class="bg-surface-2 rounded-2xl border border-border p-6">
                <h2 class="text-base font-semibold text-ink mb-3">{{ __('Friendship history') }}</h2>
                <ol class="relative border-l border-border ml-2 space-y-4">
                    @foreach($p['history'] as $h)
                        <li class="ml-4">
                            <span class="absolute -left-[5px] mt-1.5 w-2.5 h-2.5 rounded-full {{ $h['event'] === 'became_friends' ? 'bg-green-500' : ($h['event'] === 'unfriended' || $h['event'] === 'blocked' ? 'bg-red-500' : 'bg-gray-400') }}"></span>
                            <div class="text-sm font-medium text-ink">{{ __($h['label']) }}</div>
                            <div class="text-xs text-muted">{{ $h['date'] }}</div>
                        </li>
                    @endforeach
                </ol>
            </div>
        @endif

        @if($p['is_friend'] || $p['is_team'] || !empty($p['is_former']))
            {{-- chat history --}}
            <div class="bg-surface-2 rounded-2xl border border-border p-6 space-y-4">
                <h2 class="text-base font-semibold text-ink">{{ __('Chat history') }}</h2>
                <p class="text-sm text-muted">{{ __('Clearing the chat removes all messages and files from YOUR side only. The other person keeps their copy. They stay in your People list.') }}</p>
                <div class="flex flex-wrap gap-3">
                    <button type="button" id="pp-clear-me" class="btn-secondary">{{ __('Clear chat (only for me)') }}</button>
                </div>
            </div>
        @endif

        @if($p['is_friend'])
            <div class="bg-surface-2 rounded-2xl border border-red-300 p-6 space-y-3">
                <h2 class="text-base font-semibold text-red-700">{{ __('Remove friend') }}</h2>
                <p class="text-sm text-muted">{{ __('You will no longer be able to chat or call each other. Your chat history is kept (read-only) and the dates are saved in your friendship history. They will not be told. You can become friends again later.') }}</p>
                <form method="POST" action="{{ url('/people/' . $p['id'] . '/unfriend') }}" onsubmit="return confirm(@js(__('Remove :n from your friends? You will no longer be able to chat or call each other.', ['n' => $p['name']])))">
                    @csrf
                    <button type="submit" class="btn-secondary text-red-600">{{ __('Remove :n', ['n' => $p['name']]) }}</button>
                </form>
            </div>
        @endif
    </div>

    <script>
        (function () {
            var root = document.querySelector('[data-person]'); if (!root) return;
            var uid = root.getAttribute('data-user-id'), name = root.getAttribute('data-name');
            function csrf() { var m = document.querySelector('meta[name="csrf-token"]'); return m ? m.content : ''; }
            function clear(scope, text) {
                if (!confirm(text)) return;
                fetch('/friends/api/messages/' + uid + '?scope=' + scope, { method: 'DELETE', credentials: 'same-origin', headers: { 'Accept': 'application/json', 'X-CSRF-TOKEN': csrf(), 'X-Requested-With': 'XMLHttpRequest' } })
                    .then(function (r) { return r.json(); }).then(function (j) { alert(j.message || 'Done.'); })
                    .catch(function () { alert('Could not clear the chat. Try again.'); });
            }
            var a = document.getElementById('pp-clear-me');
            if (a) a.onclick = function () { clear('me', 'Clear the chat with ' + name + '?\n\nAll messages, voice messages and files disappear for YOU. ' + name + ' keeps their own copy. You stay friends.'); };
        })();
    </script>
    <script src="{{ asset('js/friend-call.js') }}?v=20261007" defer></script>
</x-layouts.app>
