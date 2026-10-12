<x-layouts.guest :title="__('Reset Password')">
    <div>
        <h2 class="text-2xl font-bold text-ink">{{ __('Reset your password') }}</h2>
        <p class="mt-2 text-sm text-muted">{{ __("Enter your email and we'll send you a reset link.") }}</p>
    </div>

    @if(session('status'))
    <div class="mt-4 p-4 bg-success/10 border border-success/20 text-success rounded-xl text-sm">
        {{ session('status') }}
    </div>
    @endif

    <form method="POST" action="{{ route('password.email') }}" class="mt-8 space-y-5"
          x-data="{ submitting: false }" @submit="submitting = true">
        @csrf
        <div>
            <label for="email" class="block text-sm font-medium text-muted mb-1">{{ __('Email address') }}</label>
            <input id="email" type="email" name="email" value="{{ old('email') }}" required autofocus
                   class="input @error('email') !border-danger @enderror"
                   placeholder="{{ __('you@company.com') }}">
            @error('email') <p class="mt-1 text-xs text-danger">{{ $message }}</p> @enderror
        </div>

        <button type="submit" :disabled="submitting"
                class="btn-primary w-full py-3"
                :class="submitting && 'opacity-75 cursor-not-allowed'">
            <span x-show="!submitting">{{ __('Send Reset Link') }}</span>
            <span x-show="submitting" x-cloak class="inline-flex items-center justify-center gap-2">
                <svg class="w-4 h-4 animate-spin" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"/><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"/></svg>
                {{ __('Sending reset link...') }}
            </span>
        </button>

        <p class="text-center text-sm text-muted">
            <a href="{{ route('login') }}" class="text-brand font-semibold hover:text-brand-strong">{{ __('Back to login') }}</a>
        </p>
    </form>
</x-layouts.guest>
