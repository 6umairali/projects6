import 'package:flutter/material.dart';

/// Shared identity for the notification center and local system notifications.
class NotificationStyle {
  final String kind, label;
  final IconData icon;
  final Color color;
  const NotificationStyle(this.kind, this.label, this.icon, this.color);

  String get smallIcon => switch (kind) {
    'email' => 'ic_notify_email',
    'chat' => 'ic_notify_chat',
    'audio_call' => 'ic_notify_call',
    'video_call' => 'ic_notify_video',
    'meeting' => 'ic_notify_meeting',
    _ => 'ic_stat_notify',
  };

  static NotificationStyle of(Map data) {
    final type = '${data['type'] ?? ''}'.toLowerCase();
    final description = '${data['body'] ?? ''}'.toLowerCase();
    final missed = type == 'missed_call' || type.startsWith('missed_');
    if (type.contains('meeting')) {
      return const NotificationStyle('meeting', 'Meeting', Icons.groups_rounded, Color(0xFF7C3AED));
    }
    if (type.contains('call')) {
      final video = data['video'] == true || '${data['video']}' == '1' || type.contains('video') || description.contains('video');
      return NotificationStyle(video ? 'video_call' : 'audio_call', '${missed ? 'Missed ' : ''}${video ? 'video' : 'audio'} call',
          video ? Icons.videocam_rounded : missed ? Icons.phone_missed_rounded : Icons.call_rounded,
          missed ? const Color(0xFFDC2626) : const Color(0xFF0891B2));
    }
    if (type.contains('email') || type.contains('mail') || type.contains('smtp')) {
      final failed = type.contains('fail') || type.contains('bounc');
      return NotificationStyle('email', failed ? 'Email delivery failed' : 'Email',
          failed ? Icons.mark_email_unread_rounded : Icons.mail_rounded,
          failed ? const Color(0xFFDC2626) : const Color(0xFF2563EB));
    }
    if (type.contains('chat') || type.contains('message') || type.contains('reply') || type.contains('conversation')) {
      return const NotificationStyle('chat', 'Chat', Icons.chat_bubble_rounded, Color(0xFF059669));
    }
    if (type.startsWith('friend')) return const NotificationStyle('friends', 'Friends', Icons.person_add_alt_1_rounded, Color(0xFF9333EA));
    if (type.contains('security')) return const NotificationStyle('security', 'Security', Icons.shield_rounded, Color(0xFFD97706));
    if (RegExp('billing|plan|trial|payment|invoice').hasMatch(type)) return const NotificationStyle('billing', 'Billing', Icons.credit_card_rounded, Color(0xFFB45309));
    if (type.contains('campaign') || type == 'admin_notice') return const NotificationStyle('campaign', 'Announcement', Icons.campaign_rounded, Color(0xFFEA580C));
    if (type.contains('workflow')) return const NotificationStyle('automation', 'Automation', Icons.account_tree_rounded, Color(0xFF4F46E5));
    if (type.contains('team')) return const NotificationStyle('team', 'Team', Icons.group_rounded, Color(0xFF0D9488));
    if (type.contains('deal')) return const NotificationStyle('deals', 'Deal', Icons.handshake_rounded, Color(0xFF0284C7));
    return const NotificationStyle('activity', 'Activity', Icons.notifications_rounded, Color(0xFF64748B));
  }
}

class NotificationCard extends StatelessWidget {
  final Map notification;
  final VoidCallback onTap;
  const NotificationCard({super.key, required this.notification, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final style = NotificationStyle.of(notification);
    final unread = notification['read'] != true;
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      label: unread ? 'Unread ${style.label}' : style.label,
      button: true,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: unread ? Color.alphaBlend(style.color.withValues(alpha: 0.06), scheme.surface) : scheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: unread ? style.color.withValues(alpha: 0.35) : scheme.outlineVariant)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(width: 44, height: 44, decoration: BoxDecoration(color: style.color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(13)), child: Icon(style.icon, color: style.color, size: 23)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text(style.label, style: TextStyle(color: style.color, fontSize: 12, fontWeight: FontWeight.w700))),
                  if (unread) Container(width: 8, height: 8, decoration: BoxDecoration(color: style.color, shape: BoxShape.circle)),
                ]),
                const SizedBox(height: 5),
                Text('${notification['title'] ?? 'Notification'}', style: TextStyle(fontWeight: unread ? FontWeight.w700 : FontWeight.w500, fontSize: 15)),
                if ('${notification['body'] ?? ''}'.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text('${notification['body']}', style: TextStyle(color: scheme.onSurfaceVariant, height: 1.35)),
                ],
                const SizedBox(height: 8),
                Text('${notification['created_at'] ?? ''}', style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 11)),
              ])),
            ]),
          ),
        ),
      ),
    );
  }
}
