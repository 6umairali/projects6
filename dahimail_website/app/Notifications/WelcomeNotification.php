<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class WelcomeNotification extends Notification
{
    use Queueable;

    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    public function toMail(object $notifiable): MailMessage
    {
        $firstName = explode(' ', $notifiable->name ?? 'there')[0];

        return (new MailMessage)
            ->subject('Welcome to ' . config('app.name') . '!')
            ->greeting("Hi {$firstName},")
            ->line('Welcome aboard! Your account is ready and we\'re excited to help you automate your communications.')
            ->line('Here\'s how to get started in under 5 minutes:')
            ->line('**1. Connect your email** — Link Gmail or Outlook with one click.')
            ->line('**2. Train your AI** — Upload a document or FAQ so replies match your voice.')
            ->line('**3. Set up auto-reply** — Choose when and how AI responds for you.')
            ->action('Start Setup', url('/onboarding/step/1'))
            ->line('Questions? Just reply to this email — a real person reads every message.')
            ->salutation('— The ' . config('app.name') . ' Team');
    }
}
