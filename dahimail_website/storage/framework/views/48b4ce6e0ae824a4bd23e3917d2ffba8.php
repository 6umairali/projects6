<?php if (isset($component)) { $__componentOriginal5863877a5171c196453bfa0bd807e410 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal5863877a5171c196453bfa0bd807e410 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.layouts.app','data' => ['title' => __('Chat')]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('layouts.app'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(__('Chat'))]); ?>
<?php \Livewire\Features\SupportCompiledWireKeys\SupportCompiledWireKeys::processComponentKey($component); ?>

    <style>
        .fc-wrap { display:flex; flex-direction:column; height: calc(100vh - 11rem); min-height: 22rem; }
        .fc-list { flex:1; overflow-y:auto; padding:1rem; display:flex; flex-direction:column; gap:.4rem; }
        .fc-row { display:flex; align-items:flex-end; gap:.35rem; } .fc-row.mine { justify-content:flex-end; }
        .fc-bubble { max-width:78%; padding:.5rem .8rem; border-radius:1rem; background:rgba(127,127,127,.16); word-wrap:break-word; overflow-wrap:anywhere; white-space:pre-wrap; font-size:.92rem; }
        .fc-row.mine .fc-bubble { background:#4F46E5; color:#fff; }
        .fc-meta { font-size:.68rem; opacity:.7; margin-top:.15rem; text-align:right; }
        .fc-file { display:flex; align-items:center; gap:.5rem; text-decoration:none; color:inherit; font-weight:600; }
        .fc-file small { display:block; font-weight:400; opacity:.75; }
        .fc-sys audio, .fc-sys video { display:block; margin:.35rem auto 0; max-width:100%; } .fc-sys video { max-height:14rem; border-radius:.6rem; }
        .fc-sys { align-self:center; font-size:.75rem; opacity:.7; padding:.15rem .7rem; border-radius:999px; background:rgba(127,127,127,.14); }
        .fc-day { align-self:center; font-size:.7rem; opacity:.6; margin:.4rem 0 .1rem; }
        .fc-quote { border-left:3px solid rgba(255,255,255,.55); background:rgba(0,0,0,.12); border-radius:.5rem; padding:.25rem .5rem; margin-bottom:.35rem; font-size:.8rem; }
        .fc-row:not(.mine) .fc-quote { border-left-color:#4F46E5; background:rgba(79,70,229,.1); }
        .fc-quote b { display:block; font-size:.72rem; } .fc-quote span { opacity:.85; display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; max-width:16rem; }
        .fc-more { opacity:0; border:0; background:transparent; cursor:pointer; font-size:1.1rem; line-height:1; padding:.2rem .3rem; color:inherit; }
        .fc-row:hover .fc-more, .fc-more:focus { opacity:.75; } @media (hover:none) { .fc-more { opacity:.5; } }
        .fc-actions { position:fixed; z-index:60; min-width:10rem; background:var(--surface-2,#fff); color:inherit; border:1px solid rgba(127,127,127,.35); border-radius:.75rem; box-shadow:0 10px 30px rgba(0,0,0,.25); padding:.25rem; }
        .fc-actions button { display:block; width:100%; text-align:left; border:0; background:transparent; color:inherit; padding:.5rem .8rem; border-radius:.5rem; font-size:.9rem; cursor:pointer; }
        .fc-actions button:hover { background:rgba(127,127,127,.15); } .fc-actions button.bad { color:#dc2626; }
        .fc-gone { background:transparent !important; border:1px dashed rgba(127,127,127,.5); color:inherit !important; opacity:.75; }
        .fc-media { display:block; max-width:100%; width:16rem; max-height:20rem; object-fit:cover; border-radius:.75rem; }
        .fc-bubble:has(img.fc-media), .fc-bubble:has(video.fc-media) { padding:.3rem; }
        .fc-tick { display:inline-flex; vertical-align:middle; margin-left:.25rem; opacity:.75; } .fc-tick.read { color:#53bdeb; opacity:1; } .fc-row.mine .fc-tick.read { color:#7dd3fc; }
        .fc-fwd { font-size:.72rem; font-style:italic; opacity:.75; margin-bottom:.15rem; }
        .fc-reacts { display:flex; flex-wrap:wrap; gap:.2rem; margin-top:.3rem; justify-content:flex-end; }
        .fc-react { border:1px solid rgba(127,127,127,.4); background:rgba(127,127,127,.18); color:inherit; border-radius:999px; padding:0 .4rem; font-size:.78rem; line-height:1.4rem; cursor:pointer; }
        .fc-react.mine { border-color:#4F46E5; background:rgba(79,70,229,.25); }
        .fc-quick { display:flex; gap:.1rem; padding:.2rem .3rem .35rem; border-bottom:1px solid rgba(127,127,127,.25); margin-bottom:.2rem; }
        .fc-actions .fc-quick button { width:auto; padding:.2rem .35rem; font-size:1.3rem; line-height:1.5rem; border-radius:999px; }
        .fc-emoji { position:fixed; z-index:70; width:19rem; max-height:15rem; overflow-y:auto; display:flex; flex-wrap:wrap; gap:.1rem; padding:.4rem; background:var(--surface-2,#fff); border:1px solid rgba(127,127,127,.35); border-radius:.75rem; box-shadow:0 10px 30px rgba(0,0,0,.25); }
        .fc-emoji button { border:0; background:transparent; font-size:1.4rem; width:2.2rem; height:2.2rem; border-radius:.5rem; cursor:pointer; } .fc-emoji button:hover { background:rgba(127,127,127,.2); }
        .fc-modal { position:fixed; inset:0; z-index:80; background:rgba(0,0,0,.5); display:flex; align-items:center; justify-content:center; padding:1rem; }
        .fc-card { background:var(--surface-2,#fff); color:inherit; border-radius:1rem; width:100%; max-width:24rem; max-height:80vh; overflow-y:auto; padding:1rem; display:flex; flex-direction:column; gap:.6rem; }
        .fc-card-h { display:flex; justify-content:space-between; align-items:center; } .fc-card-h button { border:0; background:transparent; font-size:1.5rem; line-height:1; cursor:pointer; color:inherit; }
        .fc-sub { font-size:.8rem; opacity:.7; } .fc-pick { display:flex; flex-direction:column; max-height:16rem; overflow-y:auto; } .fc-prow { display:flex; gap:.6rem; align-items:center; padding:.45rem .2rem; cursor:pointer; border-bottom:1px solid rgba(127,127,127,.15); }
        .fc-irow { display:flex; justify-content:space-between; font-size:.88rem; padding:.3rem 0; border-bottom:1px solid rgba(127,127,127,.15); }
        .fc-light { background:rgba(0,0,0,.92); flex-direction:column; } .fc-light img { max-width:96vw; max-height:84vh; object-fit:contain; border-radius:.5rem; }
        .fc-lightbar { position:absolute; top:.8rem; right:1rem; display:flex; gap:1rem; align-items:center; } .fc-lightbar a, .fc-lightbar button { color:#fff; font-size:1rem; background:transparent; border:0; cursor:pointer; text-decoration:none; } .fc-lightbar button { font-size:2rem; line-height:1; }
        .fc-deleted { font-style:italic; font-size:.88rem; }
        .fc-bubble audio { max-width:100%; height:2.2rem; } .fc-dur { font-size:.72rem; opacity:.75; }
        .fc-rec-dot { width:.7rem; height:.7rem; border-radius:50%; background:#dc2626; animation: fcpulse 1s infinite; } @keyframes fcpulse { 50% { opacity:.25; } }
    </style>

    <div class="max-w-3xl mx-auto" data-friend-chat data-user-id="<?php echo e($friend->id); ?>" data-name="<?php echo e($friend->name); ?>" data-features='<?php echo json_encode(\App\Support\FriendSettings::features(), 15, 512) ?>' data-relation='<?php echo json_encode($relation ?? null, 15, 512) ?>'>
        <div class="bg-surface-2 rounded-2xl border border-border fc-wrap" style="overflow:visible">
            <div class="flex items-center gap-3 px-4 py-3 border-b border-border">
                <a href="<?php echo e(url('/people')); ?>" class="text-muted hover:text-ink" aria-label="<?php echo e(__('Back to Friends')); ?>">&larr;</a>
                <a href="<?php echo e($friend->profileUrl()); ?>" class="flex items-center gap-3 min-w-0 flex-1" title="<?php echo e(__('Open profile')); ?>">
                    <div class="w-9 h-9 rounded-full bg-brand/10 text-brand flex items-center justify-center font-semibold overflow-hidden flex-shrink-0">
                        <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if($friend->avatar_path): ?><img src="<?php echo e(asset('storage/' . $friend->avatar_path)); ?>" alt="" class="w-full h-full object-cover"><?php else: ?><?php echo e(strtoupper(mb_substr($friend->name, 0, 1))); ?><?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?>
                    </div>
                    <div class="min-w-0"><div class="font-semibold text-ink truncate"><?php echo e($friend->name); ?></div><div id="fc-status" class="text-xs text-muted truncate"><?php echo e($friend->email); ?></div></div>
                </a>
                <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if(\App\Support\FriendSettings::callsEnabled()): ?>
                    <button type="button" id="fc-call" class="btn-secondary inline-flex items-center gap-2" title="<?php echo e(__('Audio call')); ?>" aria-label="<?php echo e(__('Audio call')); ?>">
                        <svg aria-hidden="true" class="w-5 h-5" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M22 16.92v3a2 2 0 0 1-2.18 2A19.79 19.79 0 0 1 11.19 18a19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.91-8.67A2 2 0 0 1 3.26 1h3a2 2 0 0 1 2 1.72c.12.96.35 1.9.69 2.79a2 2 0 0 1-.45 2.11L7.23 8.89a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.9.34 1.83.57 2.79.69A2 2 0 0 1 22 16.92z"/></svg>
                    </button>
                    <button type="button" id="fc-video" class="btn-primary inline-flex items-center gap-2" title="<?php echo e(__('Video call')); ?>" aria-label="<?php echo e(__('Video call')); ?>">
                        <svg aria-hidden="true" class="w-5 h-5" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="5" width="12" height="14" rx="2"/><path stroke-linecap="round" stroke-linejoin="round" d="m15 10 6-4v12l-6-4z"/></svg>
                    </button>
                <?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?>
                <div class="relative">
                    <button type="button" id="fc-menu-btn" class="p-2 text-muted hover:text-ink" aria-label="<?php echo e(__('More')); ?>" aria-haspopup="true">&#8942;</button>
                    <div id="fc-menu" class="hidden absolute right-0 mt-1 w-64 bg-surface-2 border border-border rounded-xl shadow-lg z-20 py-1 text-sm">
                        <a href="<?php echo e($friend->profileUrl()); ?>" class="block px-4 py-2 hover:bg-black/5"><?php echo e(__('View profile')); ?></a>
                        <a href="<?php echo e(url('/people/calls')); ?>" class="block px-4 py-2 hover:bg-black/5"><?php echo e(__('Call history')); ?></a>
                        <button type="button" id="fc-clear-me" class="block w-full text-left px-4 py-2 hover:bg-black/5"><?php echo e(__('Clear chat')); ?></button>
                    </div>
                </div>
            </div>

            <div id="fc-list" class="fc-list" aria-live="polite"></div>

            
            <div id="fc-readonly" class="hidden px-4 py-3 border-t border-border text-sm text-muted flex flex-wrap items-center gap-3">
                <span class="flex-1 min-w-0"><?php echo e(__('You are no longer friends, so you can read this chat but not write or call. Your history is kept.')); ?></span>
                <a href="<?php echo e($friend->profileUrl()); ?>" class="btn-secondary"><?php echo e(__('View profile')); ?></a>
            </div>

            <div id="fc-replybar" class="hidden px-4 py-2 border-t border-border text-sm flex items-center gap-3">
                <div class="min-w-0 flex-1" style="border-left:3px solid #4F46E5;padding-left:.6rem"><div id="fc-reply-name" class="text-xs font-semibold"></div><div id="fc-reply-text" class="text-xs text-muted truncate"></div></div>
                <button type="button" id="fc-reply-x" class="text-muted hover:text-ink" aria-label="<?php echo e(__('Cancel reply')); ?>">&times;</button>
            </div>

            <div id="fc-recbar" class="hidden flex items-center gap-3 p-3 border-t border-border">
                <span class="fc-rec-dot"></span><span id="fc-rec-time" class="text-sm font-medium w-12">0:00</span><span class="text-sm text-muted flex-1"><?php echo e(__('Recording…')); ?></span>
                <button type="button" id="fc-rec-cancel" class="btn-secondary"><?php echo e(__('Cancel')); ?></button>
                <button type="button" id="fc-rec-send" class="btn-primary"><?php echo e(__('Send')); ?></button>
            </div>

            <form id="fc-form" class="flex items-end gap-2 p-3 border-t border-border">
                <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if(\App\Support\FriendSettings::filesEnabled()): ?>
                    <label class="cursor-pointer text-muted hover:text-ink p-2" title="<?php echo e(__('Attach a file (max :n MB)', ['n' => \App\Support\FriendSettings::fileMaxMb()])); ?>">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"/></svg>
                        <input type="file" id="fc-file" class="hidden">
                    </label>
                <?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?>
                <button type="button" id="fc-emoji-btn" class="p-2 text-muted hover:text-ink" title="<?php echo e(__('Emoji')); ?>" aria-label="<?php echo e(__('Emoji')); ?>"><svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path stroke-linecap="round" d="M8.5 14.5a4.5 4.5 0 0 0 7 0M9 9.5h.01M15 9.5h.01"/></svg></button>
                <div class="flex-1 min-w-0">
                    <div id="fc-chosen" class="text-xs text-muted mb-1 hidden"></div>
                    <textarea id="fc-input" rows="1" placeholder="<?php echo e(__('Write a message…')); ?>" class="w-full rounded-xl border border-border bg-surface px-3 py-2 text-sm resize-none" maxlength="4000"></textarea>
                </div>
                <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if(\App\Support\FriendSettings::filesEnabled()): ?>
                                        <button type="button" id="fc-mic" class="p-2 text-muted hover:text-ink" title="<?php echo e(__('Record a voice message')); ?>" aria-label="<?php echo e(__('Record a voice message')); ?>">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="9" y="2" width="6" height="12" rx="3"/><path stroke-linecap="round" d="M5 11a7 7 0 0 0 14 0M12 18v4"/></svg>
                    </button>
                <?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?>
                <button type="submit" class="btn-primary"><?php echo e(__('Send')); ?></button>
            </form>
        </div>
        <p class="text-xs text-muted mt-2"><?php echo e(__('Messages, voice messages and files are shared only with this friend. They are not end-to-end encrypted.')); ?></p>
    </div>

    <script src="<?php echo e(asset('js/friend-call.js')); ?>?v=20261007" defer></script>
    <script src="<?php echo e(asset('js/friend-chat.js')); ?>?v=20261007" defer></script>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal5863877a5171c196453bfa0bd807e410)): ?>
<?php $attributes = $__attributesOriginal5863877a5171c196453bfa0bd807e410; ?>
<?php unset($__attributesOriginal5863877a5171c196453bfa0bd807e410); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal5863877a5171c196453bfa0bd807e410)): ?>
<?php $component = $__componentOriginal5863877a5171c196453bfa0bd807e410; ?>
<?php unset($__componentOriginal5863877a5171c196453bfa0bd807e410); ?>
<?php endif; ?>
<?php /**PATH /home/dahimail.com/public_html/resources/views/friends/chat.blade.php ENDPATH**/ ?>