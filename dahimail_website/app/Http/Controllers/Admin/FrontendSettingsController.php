<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Page;
use App\Models\SystemSetting;
use Illuminate\Http\Request;

class FrontendSettingsController extends Controller
{
    private array $pageConfig = [
        // Landing page sections
        'hero'         => ['title' => 'Hero Section',       'slug' => 'landing-hero'],
        'features'     => ['title' => 'Features Section',   'slug' => 'landing-features'],
        'testimonials' => ['title' => 'Testimonials',       'slug' => 'landing-testimonials'],
        'faq'          => ['title' => 'FAQ Section',         'slug' => 'landing-faq'],
        'cta'          => ['title' => 'CTA Section',         'slug' => 'landing-cta'],
        // Footer
        'footer'       => ['title' => 'Footer',              'slug' => 'footer'],
        // Pages
        'about'        => ['title' => 'About Us',            'slug' => 'about'],
        'why_us'       => ['title' => 'Why Us',              'slug' => 'why-us'],
        // Legal pages
        'terms'        => ['title' => 'Terms of Service',    'slug' => 'terms'],
        'privacy'      => ['title' => 'Privacy Policy',      'slug' => 'privacy'],
        'refund'       => ['title' => 'Refund Policy',        'slug' => 'refund-policy'],
        'contact'      => ['title' => 'Contact Us',           'slug' => 'contact'],
    ];

    public function index()
    {
        return view('admin.frontend-settings.index', [
            'homepageTheme' => SystemSetting::get('frontend_homepage_theme', 'classic'),
        ]);
    }

    public function updateHomepageTheme(Request $request)
    {
        $data = $request->validate([
            'frontend_homepage_theme' => ['required', 'in:classic,modern'],
        ]);

        SystemSetting::set('frontend_homepage_theme', $data['frontend_homepage_theme'], 'frontend');

        return redirect()
            ->route('admin.frontend-settings.index')
            ->with('success', __('Homepage design updated successfully.'));
    }

    public function edit(string $type)
    {
        abort_unless(array_key_exists($type, $this->pageConfig), 404);

        $config = $this->pageConfig[$type];
        $page = Page::firstOrCreate(
            ['type' => $type],
            [
                'title'        => $config['title'],
                'slug'         => $config['slug'],
                'is_published' => true,
            ]
        );

        $content = array_merge($this->getDefaults($type), $page->content ?? []);

        return view('admin.frontend-settings.edit', [
            'page'      => $page,
            'content'   => $content,
            'type'      => $type,
            'pageTitle' => $config['title'],
        ]);
    }

    public function update(Request $request, string $type)
    {
        abort_unless(array_key_exists($type, $this->pageConfig), 404);

        $config = $this->pageConfig[$type];
        $page = Page::firstOrCreate(
            ['type' => $type],
            [
                'title'        => $config['title'],
                'slug'         => $config['slug'],
                'is_published' => true,
            ]
        );

        $page->update([
            'content'      => $request->input('content', []),
            'is_published' => (bool) $request->input('is_published', true),
        ]);

        return redirect()
            ->route('admin.frontend-settings.edit', $type)
            ->with('success', $config['title'] . ' updated successfully.');
    }

    private function getDefaults(string $type): array
    {
        return [];
    }
}
