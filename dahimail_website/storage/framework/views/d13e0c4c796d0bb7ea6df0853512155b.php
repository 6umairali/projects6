<div wire:poll.5s.visible="$refresh">
    <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if(count($recentChats)): ?>
        <div class="max-w-5xl mx-auto mb-4">
            <div class="bg-surface-2 rounded-2xl border border-border overflow-hidden">
                <div class="px-4 py-3 border-b border-border flex items-center justify-between">
                    <div class="font-medium text-ink"><?php echo e(__('Chats')); ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if(($unreadAll = collect($recentChats)->sum('unread')) > 0): ?><span class="ml-2 text-xs rounded-full bg-brand text-white px-2 py-0.5"><?php echo e($unreadAll); ?></span><?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?></div>
                    <a href="<?php echo e(url('/inbox')); ?>" class="text-xs text-brand hover:underline"><?php echo e(__('Customer chats & mail')); ?> &rarr;</a>
                </div>
                <div class="divide-y divide-border max-h-96 overflow-y-auto">
                    <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php \Livewire\Features\SupportCompiledWireKeys\SupportCompiledWireKeys::openLoop(); ?><?php endif; ?><?php $__currentLoopData = $recentChats; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><?php \Livewire\Features\SupportCompiledWireKeys\SupportCompiledWireKeys::startLoop($loop->index); ?><?php endif; ?>
                        <a <?php \Livewire\Features\SupportCompiledWireKeys\SupportCompiledWireKeys::$currentLoop['key'] = 'recent-chat-'.e($c['id']).''; ?>wire:key="recent-chat-<?php echo e($c['id']); ?>" href="<?php echo e($c['chat_url']); ?>" class="flex items-center gap-3 px-4 py-3 hover:bg-black/5">
                            <div class="relative flex-shrink-0">
                                <div class="w-11 h-11 rounded-full bg-brand/10 text-brand flex items-center justify-center font-semibold overflow-hidden"><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if($c['avatar_url']): ?><img src="<?php echo e($c['avatar_url']); ?>" alt="" class="w-full h-full object-cover"><?php else: ?><?php echo e(strtoupper(mb_substr($c['name'], 0, 1))); ?><?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?></div>
                                <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if($c['online']): ?><span class="absolute right-0 bottom-0 w-3 h-3 rounded-full bg-green-500 border-2 border-surface-2"></span><?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?>
                            </div>
                            <div class="min-w-0 flex-1">
                                <div class="flex items-center justify-between gap-2"><span class="font-medium text-ink truncate <?php echo e($c['unread'] ? 'font-bold' : ''); ?>"><?php echo e($c['name']); ?></span><span class="text-xs <?php echo e($c['unread'] ? 'text-brand font-semibold' : 'text-muted'); ?>"><?php echo e($c['time']); ?></span></div>
                                <div class="flex items-center justify-between gap-2">
                                    <span class="text-sm text-muted truncate"><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if($c['mine'] && !in_array($c['message_kind'], ['call', 'system'])): ?><span class="<?php echo e(($c['status'] ?? '') === 'read' ? 'text-sky-500' : ''); ?>"><?php echo e(($c['status'] ?? 'sent') === 'sent' ? '✓' : '✓✓'); ?></span> <?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?><?php echo e($c['preview']); ?></span>
                                    <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if BLOCK]><![endif]--><?php endif; ?><?php if($c['unread']): ?><span class="text-xs rounded-full bg-brand text-white px-2 py-0.5 flex-shrink-0"><?php echo e($c['unread']); ?></span><?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?>
                                </div>
                            </div>
                        </a>
                    <?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><?php \Livewire\Features\SupportCompiledWireKeys\SupportCompiledWireKeys::endLoop(); ?><?php endif; ?><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php \Livewire\Features\SupportCompiledWireKeys\SupportCompiledWireKeys::closeLoop(); ?><?php endif; ?>
                </div>
            </div>
        </div>
    <?php elseif($enabled): ?>
        <p class="max-w-5xl mx-auto mb-4 text-sm text-muted"><?php echo e(__('Your conversations will appear here.')); ?></p>
    <?php endif; ?><?php if(\Livewire\Mechanisms\ExtendBlade\ExtendBlade::isRenderingLivewireComponent()): ?><!--[if ENDBLOCK]><![endif]--><?php endif; ?>
</div>
<?php /**PATH /home/dahimail.com/public_html/resources/views/livewire/friends/recent-chats.blade.php ENDPATH**/ ?>