import 'package:flutter/material.dart';
import 'notification_presentation.dart';
import 'widgets.dart';

/// Compact sender banner shared by the notification center and in-app alerts.
class NotificationTile extends StatelessWidget {
  final Map notification;
  final VoidCallback onTap;
  final bool compact;
  const NotificationTile({super.key, required this.notification, required this.onTap, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final n = notification;
    final style = NotificationPresentation.from(n);
    final unread = n['read'] != true;
    final name = NotificationPresentation.sender(n);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(textDirection: TextDirection.ltr, children: [
          Stack(children: [
            Avatar(name, url: NotificationPresentation.avatar(n), radius: 22),
            if (unread) Positioned(right: 0, bottom: 0, child: Semantics(label: 'Unread', child: Container(width: 9, height: 9, decoration: BoxDecoration(color: style.color, shape: BoxShape.circle, border: Border.all(color: Theme.of(context).colorScheme.surface, width: 1.5))))),
          ]),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: unread ? FontWeight.w700 : FontWeight.w500)),
            const SizedBox(height: 4),
            Row(children: [
              Icon(style.icon, color: style.color, size: 16),
              const SizedBox(width: 5),
              Expanded(child: Text(style.action(n), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: style.color, fontSize: 12))),
            ]),
            if ('${n['body'] ?? ''}'.isNotEmpty) Padding(padding: const EdgeInsets.only(top: 4), child: Text('${n['body']}', maxLines: 2, overflow: TextOverflow.ellipsis)),
            if (!compact && '${n['created_at'] ?? ''}'.isNotEmpty) Padding(padding: const EdgeInsets.only(top: 4), child: Text('${n['created_at']}', style: Theme.of(context).textTheme.bodySmall)),
          ])),
          const SizedBox(width: 10),

        ]),
      ),
    );
  }
}
