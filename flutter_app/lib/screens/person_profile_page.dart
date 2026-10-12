import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/api.dart';
import '../core/calls.dart';
import '../core/theme.dart';
import '../core/util.dart';
import '../core/widgets.dart';
import 'compose_page.dart';
import 'friend_chat_page.dart';

/// Profile of a friend or teammate: photo, name, username, email and details; ways to reach them; chat history options;
/// and (for friends) the Remove friend button – it lives ONLY here, always behind a warning.
class PersonProfilePage extends StatefulWidget {
  final int userId;
  const PersonProfilePage({super.key, required this.userId});
  @override
  State<PersonProfilePage> createState() => _PersonProfilePageState();
}

class _PersonProfilePageState extends State<PersonProfilePage> {
  final int _v = 0;

  Future<void> _clear(Map<String, dynamic> p) async {
    final name = '${p['name']}';
    final ok = await confirmDialog(context, 'Clear this chat?', 'All messages, voice messages and files disappear for you. $name keeps their own copy. $name stays in your People list.', action: 'Clear chat', danger: true);
    if (ok && mounted) await run(context, (a) => a.delete('friends/${p['id']}/messages'), ok: '*');
  }

  Future<void> _remove(Map<String, dynamic> p) async {
    final name = '${p['name']}';
    final ok = await confirmDialog(
      context,
      'Remove $name from your friends?',
      'You will no longer be able to chat or call each other, and $name will not see you in their friends. They are not told. Your chat history is kept (read-only) and the dates are saved in your friendship history. You can become friends again later.',
      action: 'Remove friend',
      danger: true,
    );
    if (!ok || !mounted) return;
    if (await run(context, (a) => a.delete('friends/${p['id']}'), ok: '*') && mounted) Navigator.of(context).pop();
  }

  void _photo(Map<String, dynamic> p) {
    final url = p['avatar_url'] as String?;
    if (url == null || url.isEmpty) return;
    showDialog<void>(
      context: context,
      builder: (c) => Dialog(
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(onTap: () => Navigator.pop(c), child: InteractiveViewer(child: Image.network(url, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Padding(padding: EdgeInsets.all(40), child: Icon(Icons.broken_image_outlined, size: 48))))),
      ),
    );
  }

  Widget _row(String label, String? value, {bool copy = false}) {
    if (value == null || value.trim().isEmpty) return const SizedBox.shrink();
    return ListTile(
      dense: true,
      title: Text(label, style: const TextStyle(fontSize: 12.5, color: AppColors.muted)),
      subtitle: Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      trailing: copy ? IconButton(tooltip: 'Copy', icon: const Icon(Icons.copy_rounded, size: 20), onPressed: () { Clipboard.setData(ClipboardData(text: value)); toast(context, '$label copied'); }) : null,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: AsyncView<Map<String, dynamic>>(
          key: ValueKey(_v),
          load: (api) async => Api.obj(await api.get('people/${widget.userId}')),
          builder: (c, p, reload) {
            final name = '${p['name']}';
            final isFriend = p['is_friend'] == true, isTeam = p['is_team'] == true;
            final team = p['team'] is Map ? Map<String, dynamic>.from(p['team'] as Map) : null;
            final f = p['features'] is Map ? Map<String, dynamic>.from(p['features'] as Map) : <String, dynamic>{'chat': true, 'files': true, 'calls': true, 'max_mb': 10};
            final isFormer = p['is_former'] == true;
            final canTalk = (isFriend || isTeam) && f['chat'] != false;
            final canRead = (canTalk || isFormer) && f['chat'] != false;     // former friends: read-only history
            final history = Api.list(p['history']);
            final localTime = p['local_time'] != null ? '${p['local_time']}${p['timezone'] != null ? '  (${p['timezone']})' : ''}' : null;
            return RefreshIndicator(
              onRefresh: reload,
              child: ListView(padding: const EdgeInsets.fromLTRB(16, 12, 16, 40), children: [
                AppCard(
                  child: Column(children: [
                    GestureDetector(onTap: () => _photo(p), child: Avatar(name, url: p['avatar_url'] as String?, radius: 52)),
                    const SizedBox(height: 14),
                    Text(name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    if ('${p['username'] ?? ''}'.isNotEmpty) Padding(padding: const EdgeInsets.only(top: 2), child: Text('${p['username']}'.replaceFirst(RegExp(r'^@+'), ''), style: const TextStyle(color: AppColors.muted, fontSize: 14.5))),
                    if ('${p['status_label'] ?? ''}'.isNotEmpty) Padding(padding: const EdgeInsets.only(top: 4), child: Text('${p['status_label']}', style: TextStyle(color: p['online'] == true ? AppColors.success : AppColors.muted, fontSize: 13.5, fontWeight: p['online'] == true ? FontWeight.w700 : FontWeight.w400))),
                    const SizedBox(height: 10),
                    Wrap(spacing: 8, runSpacing: 6, alignment: WrapAlignment.center, children: [
                      if (isFriend) const Chip(avatar: Icon(Icons.people_alt_rounded, size: 16), label: Text('Friend'), visualDensity: VisualDensity.compact),
                      if (isFormer) Chip(avatar: const Icon(Icons.history_rounded, size: 16), label: Text('Unfriended${p['unfriended_on'] != null ? ' · ${p['unfriended_on']}' : ''}'), visualDensity: VisualDensity.compact),
                      if (isTeam) Chip(avatar: const Icon(Icons.groups_rounded, size: 16), label: Text('Team${team?['role'] != null ? ' · ${team!['role']}' : ''}'), visualDensity: VisualDensity.compact),
                    ]),
                    if (canTalk || canRead || '${p['email'] ?? ''}'.isNotEmpty) ...[
                      const SizedBox(height: 14),
                      Wrap(spacing: 8, runSpacing: 8, alignment: WrapAlignment.center, children: [
                        if (canTalk)
                          FilledButton.icon(
                            style: FilledButton.styleFrom(minimumSize: const Size(0, 44)),
                            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
                            label: Text(((p['unread'] as int?) ?? 0) > 0 ? 'Chat · ${p['unread']}' : 'Chat'),
                            onPressed: () => pushPage(c, FriendChatPage(friend: {'id': p['id'], 'name': name, 'avatar_url': p['avatar_url']}, features: f)),
                          ),
                        if (isFormer && canRead)
                          FilledButton.icon(
                            style: FilledButton.styleFrom(minimumSize: const Size(0, 44)),
                            icon: const Icon(Icons.history_rounded, size: 18),
                            label: const Text('Open chat history'),
                            onPressed: () => pushPage(c, FriendChatPage(friend: {'id': p['id'], 'name': name, 'avatar_url': p['avatar_url'], 'former': true}, features: f)),
                          ),
                        if (canTalk && f['calls'] == true)
                          OutlinedButton.icon(style: OutlinedButton.styleFrom(minimumSize: const Size(0, 44)), icon: const Icon(Icons.call_rounded, size: 18), label: const Text('Call'), onPressed: () => CallManager.I.startCall(c, p['id'] as int)),
                        if (canTalk && f['calls'] == true)
                          OutlinedButton.icon(style: OutlinedButton.styleFrom(minimumSize: const Size(0, 44)), icon: const Icon(Icons.videocam_rounded, size: 18), label: const Text('Video'), onPressed: () => CallManager.I.startVideoCall(c, p['id'] as int, name)),
                        if ('${p['email'] ?? ''}'.isNotEmpty)
                          OutlinedButton.icon(style: OutlinedButton.styleFrom(minimumSize: const Size(0, 44)), icon: const Icon(Icons.mail_outline_rounded, size: 18), label: const Text('Email'), onPressed: () => pushPage(c, ComposePage(contact: {'email': p['email'], 'first_name': name}))),
                      ]),
                    ],
                  ]),
                ),
                const SectionHeader('Details'),
                AppCard(
                  padding: EdgeInsets.zero,
                  child: Column(children: [
                    _row('Email', '${p['email'] ?? ''}', copy: true),
                    _row('Username', '${p['username'] ?? ''}'.isEmpty ? null : '${p['username']}'.replaceFirst(RegExp(r'^@+'), '')),
                    _row('Member since', p['member_since'] as String?),
                    _row('Friends since', p['friend_since'] as String?),
                    _row('Role in your workspace', team?['role'] as String?),
                    _row('Last active', team?['last_active'] as String?),
                    _row('Local time', localTime),
                    _row('Language', p['language'] as String?),
                  ]),
                ),
                if (history.isNotEmpty) ...[
                  const SectionHeader('Friendship history'),
                  AppCard(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(children: [
                      for (final h in history)
                        ListTile(
                          dense: true,
                          leading: Icon(
                            h['event'] == 'became_friends' ? Icons.people_alt_rounded : (h['event'] == 'unfriended' || h['event'] == 'blocked') ? Icons.person_remove_alt_1_rounded : Icons.mail_outline_rounded,
                            color: h['event'] == 'became_friends' ? AppColors.success : (h['event'] == 'unfriended' || h['event'] == 'blocked') ? AppColors.danger : AppColors.muted,
                          ),
                          title: Text('${h['label']}', style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text('${h['date']}', style: const TextStyle(fontSize: 12.5)),
                        ),
                    ]),
                  ),
                ],
                if (canTalk) ...[
                  const SectionHeader('Chat history'),
                  AppCard(
                    padding: EdgeInsets.zero,
                    child: Column(children: [
                      ListTile(
                        leading: const IconTile(Icons.cleaning_services_outlined),
                        title: const Text('Clear chat (only for me)', style: TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text('Deletes all messages and files for you. $name keeps theirs.', style: const TextStyle(fontSize: 12.5)),
                        onTap: () => _clear(p),
                      ),
                    ]),
                  ),
                ],
                if (isFriend) ...[
                  const SectionHeader('Friendship'),
                  AppCard(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: const IconTile(Icons.person_remove_alt_1_rounded, color: AppColors.danger),
                      title: Text('Remove $name', style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.danger)),
                      subtitle: const Text('You will no longer be able to chat or call each other.', style: TextStyle(fontSize: 12.5)),
                      onTap: () => _remove(p),
                    ),
                  ),
                ],
              ]),
            );
          },
        ),
      );
}
