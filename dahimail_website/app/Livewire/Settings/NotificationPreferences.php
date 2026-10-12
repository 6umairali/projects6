<?php

namespace App\Livewire\Settings;

use Livewire\Component;

class NotificationPreferences extends Component
{
    public bool $emailNotifs = true;
    public bool $inAppNotifs = true;
    public bool $slackNotifs = false;

    public array $events = [];

    private const DEFAULTS = [
        'newConversation' => ['email' => true, 'inApp' => true, 'slack' => false],
        'assignment' => ['email' => true, 'inApp' => true, 'slack' => false],
        'aiDraftReady' => ['email' => false, 'inApp' => true, 'slack' => false],
        'teamMention' => ['email' => true, 'inApp' => true, 'slack' => false],
        'contactReply' => ['email' => true, 'inApp' => true, 'slack' => false],
        'campaignComplete' => ['email' => true, 'inApp' => true, 'slack' => false],
        'weeklyDigest' => ['email' => true, 'inApp' => false, 'slack' => false],
        'billingAlerts' => ['email' => true, 'inApp' => true, 'slack' => false],
    ];

    public function mount(): void
    {
        $prefs = auth()->user()->notification_preferences ?? [];

        $this->emailNotifs = $prefs['emailNotifs'] ?? true;
        $this->inAppNotifs = $prefs['inAppNotifs'] ?? true;
        $this->slackNotifs = $prefs['slackNotifs'] ?? false;
        $this->events = $prefs['events'] ?? self::DEFAULTS;
    }

    public function save(): void
    {
        auth()->user()->update([
            'notification_preferences' => [
                'emailNotifs' => $this->emailNotifs,
                'inAppNotifs' => $this->inAppNotifs,
                'slackNotifs' => $this->slackNotifs,
                'events' => $this->events,
            ],
        ]);

        session()->flash('success', 'Notification preferences saved.');
    }

    public function render()
    {
        return view('livewire.settings.notification-preferences');
    }
}
