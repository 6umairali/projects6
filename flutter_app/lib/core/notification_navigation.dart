import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'notification_actions.dart';
import 'notification_presentation.dart';
import '../screens/friend_chat_page.dart';
import '../screens/inbox_screens.dart';
import '../screens/meeting_room_page.dart';
import '../screens/friends_screens.dart';
import 'widgets.dart';

class NotificationNavigation {
  static Future<void> open(BuildContext context, Map data) async {
    final recipient = int.tryParse('${data['recipient_user_id'] ?? ''}');
    if (recipient != null && recipient != Api.of(context).session.userId) return;
    if ('${data['draft_reply'] ?? ''}'.isNotEmpty) {
      final edit = await showDialog<bool>(context: context, builder: (c) => AlertDialog(
        title: const Text('Reply not confirmed'),
        content: SelectableText('Check the conversation before sending again. Your draft:\n\n${data['draft_reply']}'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('View conversation')),
          TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Edit reply')),
        ],
      ));
      if (!context.mounted || edit == null) return;
      if (edit) { await reply(context, data); return; }
    }
    final path = Uri.tryParse('${data['action_url'] ?? ''}');
    final friend = int.tryParse('${data['from_id'] ?? data['caller_id'] ?? ''}') ??
        (path?.pathSegments.length == 3 && path!.pathSegments.take(2).join('/') == 'friends/chat' ? int.tryParse(path.pathSegments.last) : null);
    final conversation = int.tryParse(path?.queryParameters['cid'] ?? path?.queryParameters['conversation'] ?? '');
    Widget? page;
    final type = '${data['type'] ?? ''}';
    if (type == 'friend_verify') {
      page = const AppPage(title: 'Phone & discovery', body: PhoneDiscoveryPage());
    } else if (type.startsWith('friend') && !type.contains('meeting')) {
      page = const AppPage(title: 'Friends', body: FriendsPage());
    } else if (friend != null && friend > 0 && (type == 'chat' || type.contains('call'))) {
      page = FriendChatPage(friend: {'id': friend, 'name': NotificationPresentation.sender(data), 'avatar_url': NotificationPresentation.avatar(data)}, features: const {'chat': true, 'files': true, 'calls': true, 'max_mb': 10});
    } else if (conversation != null && conversation > 0 && path?.path == '/inbox') {
      page = ConversationDetailPage(id: conversation);
    } else if (path?.pathSegments.length == 2 && path!.pathSegments.first == 'meet') {
      page = MeetingRoomPage(code: path.pathSegments.last, title: '${data['title'] ?? 'Meeting'}');
    }
    if (page != null) {
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => page!));
    } else {
      await showDialog<void>(context: context, builder: (c) => AlertDialog(
        title: Text(NotificationPresentation.sender(data)), content: SingleChildScrollView(child: SelectableText('${data['body'] ?? data['title'] ?? ''}')),
        actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text('Close'))]));
    }
  }

  static Future<void> reply(BuildContext context, Map data) async {
    if (NotificationTarget.from(data) == null) return;
    final api = Api.of(context);
    final recipient = int.tryParse('${data['recipient_user_id'] ?? ''}');
    if (recipient != null && recipient != api.session.userId) return;
    await showModalBottomSheet<void>(context: context, isScrollControlled: true,
      builder: (_) => _NotificationReplySheet(data: data, api: api));
  }
}

class _NotificationReplySheet extends StatefulWidget {
  final Map data;
  final Api api;
  const _NotificationReplySheet({required this.data, required this.api});
  @override
  State<_NotificationReplySheet> createState() => _NotificationReplySheetState();
}

class _NotificationReplySheetState extends State<_NotificationReplySheet> {
  late final controller = TextEditingController(text: '${widget.data['draft_reply'] ?? ''}');
  bool sending = false;
  String? error;
  @override
  void dispose() { controller.dispose(); super.dispose(); }

  Future<void> send() async {
    setState(() { sending = true; error = null; });
    final client = http.Client();
    bool sent;
    try {
      sent = await sendNotificationReply({...widget.data,
        'recipient_user_id': widget.data['recipient_user_id'] ?? widget.api.session.userId}, controller.text,
        token: widget.api.session.token ?? '', userId: widget.api.session.userId ?? 0, client: client);
    } finally { client.close(); }
    if (!mounted) return;
    if (sent) { Navigator.pop(context); }
    else { setState(() { sending = false; error = 'Reply not confirmed. Check the conversation before trying again.'; }); }
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.viewInsetsOf(context).bottom + 20),
    child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Reply to ${NotificationPresentation.sender(widget.data)}', style: Theme.of(context).textTheme.titleMedium),
      const SizedBox(height: 12),
      TextField(controller: controller, autofocus: true, minLines: 2, maxLines: 5, maxLength: 4000, enabled: !sending,
        decoration: const InputDecoration(hintText: 'Write your reply')),
      if (error != null) Text(error!, style: const TextStyle(color: Colors.red)),
      FilledButton(onPressed: sending ? null : send, child: Text(sending ? 'Sending…' : 'Send')),
    ]),
  );
}
