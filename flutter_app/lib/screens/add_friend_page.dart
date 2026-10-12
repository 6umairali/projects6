import 'dart:async';
import 'package:flutter/material.dart';
import '../core/api.dart';
import '../core/paged.dart';
import '../core/theme.dart';
import '../core/util.dart';
import '../core/widgets.dart';
import 'friend_chat_page.dart';

/// Find a person and send a friend request: type a username, a name, a FULL e-mail address (name@dahimail.com) or a phone number.
/// The person becomes a friend when they accept.
class AddFriendPage extends StatefulWidget {
  const AddFriendPage({super.key});
  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  final _q = TextEditingController();
  Timer? _t;
  List<Item> _res = [];
  static const _idle = 'Search by name, username, e-mail address or phone number (with country code, e.g. +92300…).';
  String _hint = _idle;
  bool _busy = false;
  int _seq = 0;

  @override
  void dispose() {
    _t?.cancel();
    _q.dispose();
    super.dispose();
  }

  void _typed(String v) {
    _t?.cancel();
    final q = v.trim();
    if (q.length < 3) {
      setState(() { _res = []; _busy = false; _hint = q.isEmpty ? _idle : 'Type at least 3 characters.'; });
      return;
    }
    _t = Timer(const Duration(milliseconds: 450), () => _go(q));
  }

  Future<void> _go(String q) async {
    final my = ++_seq;
    setState(() => _busy = true);
    try {
      final j = await Api.of(context).getNoCache('friends/search', query: {'q': q});
      if (!mounted || my != _seq) return;
      final list = Api.list(j);
      setState(() {
        _res = list;
        _hint = list.isEmpty ? '${(j is Map ? j['hint'] : null) ?? 'Nobody found. Check the spelling, or type the full e-mail address, or the phone number with its country code.'}' : '';
      });
    } on ApiException catch (e) {
      if (mounted && my == _seq) setState(() { _res = []; _hint = e.message; });
    } finally {
      if (mounted && my == _seq) setState(() => _busy = false);
    }
  }

  Future<void> _add(Item p) async {
    try {
      await Api.of(context).post('friends/requests', {'user_id': p['id']});
      if (mounted) {
        setState(() => p['relation'] = 'sent');
        toast(context, 'Request sent to ${p['name']}. They get a notification on their phone.');
      }
    } on ApiException catch (e) {
      if (mounted) toast(context, e.message, error: true);
    }
  }

  Widget _action(Item p) {
    switch ('${p['relation']}') {
      case 'friend':
        return OutlinedButton(onPressed: () => pushPage(context, FriendChatPage(friend: {'id': p['id'], 'name': p['name'], 'avatar_url': p['avatar_url']}, features: const {'chat': true, 'files': true, 'calls': true, 'max_mb': 10})), child: const Text('Chat'));
      case 'sent':
        return const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('Request sent', style: TextStyle(color: AppColors.muted)));
      case 'received':
        return const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('Wants to be\nyour friend', textAlign: TextAlign.center, style: TextStyle(color: AppColors.primary, fontSize: 12)));
      default:
        return FilledButton.icon(icon: const Icon(Icons.person_add_alt_1_rounded, size: 18), onPressed: () => _add(p), label: const Text('Send request'));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Find people')),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _q,
              autofocus: true,
              autocorrect: false,
              textInputAction: TextInputAction.search,
              onChanged: _typed,
              onSubmitted: (v) { if (v.trim().length >= 3) _go(v.trim()); },
              decoration: InputDecoration(hintText: 'Name, username, e-mail or phone', prefixIcon: const Icon(Icons.search_rounded), suffixIcon: _q.text.isEmpty ? null : IconButton(icon: const Icon(Icons.close_rounded), onPressed: () { _q.clear(); _typed(''); })),
            ),
          ),
          if (_busy) const LinearProgressIndicator(minHeight: 2),
          if (_hint.isNotEmpty) Padding(padding: const EdgeInsets.all(20), child: Text(_hint, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.muted))),
          Expanded(
            child: ListView.separated(
              itemCount: _res.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) {
                final p = _res[i];
                return ListTile(
                  leading: Avatar('${p['name']}', url: p['avatar_url'] as String?, radius: 22),
                  title: Text('${p['name']}', style: const TextStyle(fontWeight: FontWeight.w700)),
                  subtitle: Text([if ('${p['username'] ?? ''}'.isNotEmpty) '${p['username']}'.replaceFirst(RegExp(r'^@+'), ''), switch ('${p['via']}') { 'email' => 'found by e-mail', 'phone' => 'found by phone', _ => '' }].where((e) => e.isNotEmpty).join('  ·  ')),
                  trailing: _action(p),
                );
              },
            ),
          ),
        ]),
      );
}
