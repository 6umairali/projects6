import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/api.dart';
import '../core/refresh.dart';
import '../core/notification_presentation.dart';
import '../core/calls.dart';
import '../core/conversation_visibility.dart';
import '../core/forms.dart';
import '../core/paged.dart';
import '../core/session.dart';
import '../core/theme.dart';
import '../core/util.dart';
import '../core/widgets.dart';
import 'compose_page.dart';
import 'email_view_page.dart';
import 'friend_chat_page.dart';
export 'compose_page.dart';

/// Conversation list for any inbox folder / channel.
/// [folder]: inbox | sent | starred | snoozed | spam | archive | trash
/// [channel]: all | email | whatsapp | sms | telegram | slack | chat
class ConversationsPage extends StatefulWidget {
  final String folder;
  final String channel;
  final bool socialOnly;
  const ConversationsPage({super.key, this.folder = 'inbox', this.channel = 'all', this.socialOnly = false});
  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  String _chip = 'all'; // all | unread | mine
  String _tag = '';
  String _q = '';
  int? _account;
  final _ctrl = TextEditingController();
  List<Item> _tags = [], _accounts = [];
  final _selected = <int>{};
  final _key = GlobalKey<PagedListState>();
  String _channel = 'all'; // Chats tab: channel filter (all / whatsapp / telegram / sms / slack / live_chat)
  Timer? _timer, _poller;
  bool _syncing = false;
  int _lastId = 0, _lastUnread = -1, _lastTotal = -1;

  // ── Chats tab: direct chats with Dahimail friends and teammates are part of the same list ──
  List<Item> _friends = [];
  Map<String, dynamic> _friendFeatures = {'chat': true, 'files': true, 'calls': true, 'max_mb': 10};

  Future<void> _loadFriends() async {
    if (!widget.socialOnly || !mounted) return;
    try {
      final j = await Api.of(context).getNoCache('friends/chats');
      final list = Api.list(j);
      if (!mounted) return;
      setState(() {
        _friends = list;
        if (j is Map && j['features'] is Map) _friendFeatures = Map<String, dynamic>.from(j['features'] as Map);
      });
    } catch (_) {}
  }

  List<Item> _friendItems() {
    if (!widget.socialOnly) return const [];
    if (_channel != 'all' && _channel != 'friends') return const []; // another channel is selected
    if (_chip == 'mine') return const [];                              // "assigned to me" is for customer chats
    var l = _friends;
    if (_chip == 'unread') l = l.where((f) => ((f['unread'] as num?) ?? 0) > 0).toList();
    if (_q.isNotEmpty) {
      final q = _q.toLowerCase();
      l = l.where((f) => '${f['name']}'.toLowerCase().contains(q) || '${f['preview']}'.toLowerCase().contains(q)).toList();
    }
    return l;
  }

  /// newest first; a row without a time (older server) stays where the server put it, friends first
  int _byTime(Item a, Item b) {
    final x = DateTime.tryParse('${a['at'] ?? ''}'), y = DateTime.tryParse('${b['at'] ?? ''}');
    if (x == null && y == null) return 0;
    if (x == null) return a['kind'] == 'friend' ? -1 : 1;
    if (y == null) return b['kind'] == 'friend' ? 1 : -1;
    return y.compareTo(x);
  }

  Widget _friendRow(BuildContext c, Item f) {
    final unread = ((f['unread'] as num?) ?? 0).toInt();
    final surface = Theme.of(c).colorScheme.surface;
    final accent = AppColors.accentOf(c);
    final st = '${f['status'] ?? ''}';
    return Material(
      color: unread > 0 ? Color.alphaBlend(AppColors.primary.withValues(alpha: 0.05), surface) : surface,
      child: InkWell(
        onTap: () async {
          await pushPage(c, FriendChatPage(friend: {'id': f['id'], 'name': f['name'], 'avatar_url': f['avatar_url'], 'former': f['former']}, features: _friendFeatures));
          _loadFriends();
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.borderOf(c)))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(clipBehavior: Clip.none, children: [
              Avatar('${f['name']}', url: f['avatar_url'] as String?, radius: 24),
              if (f['online'] == true) Positioned(right: -1, bottom: -1, child: Container(width: 13, height: 13, decoration: BoxDecoration(color: AppColors.success, shape: BoxShape.circle, border: Border.all(color: surface, width: 2)))),
            ]),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text('${f['name']}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15.5, fontWeight: unread > 0 ? FontWeight.w800 : FontWeight.w600))),
                  const SizedBox(width: 8),
                  Text('${f['time'] ?? ''}', style: TextStyle(fontSize: 12, fontWeight: unread > 0 ? FontWeight.w700 : FontWeight.w400, color: unread > 0 ? accent : AppColors.muted)),
                ]),
                const SizedBox(height: 3),
                Row(children: [
                  if (hasMessageReceipt(f)) Padding(padding: const EdgeInsets.only(right: 4), child: Icon(st == 'sent' || st.isEmpty ? Icons.done_rounded : Icons.done_all_rounded, size: 16, color: st == 'read' ? const Color(0xFF53BDEB) : AppColors.muted)),
                  Expanded(child: Text('${f['preview'] ?? ''}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13.5, color: unread > 0 ? null : AppColors.muted, fontWeight: unread > 0 ? FontWeight.w600 : FontWeight.w400))),
                  if (unread > 0)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      constraints: const BoxConstraints(minWidth: 22),
                      decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(12)),
                      child: Text(unread > 99 ? '99+' : '$unread', textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                    ),
                ]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  /// Cheap check (one small SQL aggregate on the server) every 6 s: new chat / social / email rows appear
  /// immediately without waiting for the slow mail-server sync.
  Future<void> _pollNow() async {
    if (!mounted || !TickerMode.valuesOf(context).enabled) return;
    _loadFriends();
    try {
      final j = Api.obj(await Api.of(context).get('inbox/poll', query: {'last_id': '$_lastId'}));
      final latest = (j['latest_id'] as num?)?.toInt() ?? 0, unread = (j['unread'] as num?)?.toInt() ?? 0, total = (j['total'] as num?)?.toInt() ?? 0;
      final first = _lastUnread == -1;
      final changed = !first && (latest != _lastId || unread != _lastUnread || total != _lastTotal);
      _lastId = latest; _lastUnread = unread; _lastTotal = total;
      if (changed && mounted) _key.currentState?.reload();
    } catch (_) {}
  }

  /// Pulls new mail from the mail server (same call the website's inbox makes) and refreshes the list.
  Future<void> _sync() async {
    if (_syncing || !mounted || !TickerMode.valuesOf(context).enabled) return;
    setState(() => _syncing = true);
    try {
      final api = Api.of(context);
      var got = 0;
      for (var i = 0; i < 6; i++) {
        final r = await api.post('inbox/sync');
        final n = r is Map && r['synced'] is num ? (r['synced'] as num).toInt() : 0;
        got += n;
        if (!(r is Map && r['has_more'] == true)) break;
      }
      if (got > 0 && mounted) _key.currentState?.reload();
    } catch (_) {
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _poller?.cancel();
    CallManager.I.unreadChat.removeListener(_loadFriends);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) { _pollNow(); _sync(); _loadFriends(); });
    CallManager.I.unreadChat.addListener(_loadFriends); // a friend wrote -> the row moves up at once
    _timer = Timer.periodic(const Duration(seconds: 60), (_) => _sync());
    _poller = Timer.periodic(const Duration(seconds: 6), (_) => _pollNow());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final api = Api.of(context);
      try {
        final t = Api.list(await api.get('inbox/tags'));
        final a = Api.list(await api.get('inbox/accounts'));
        if (mounted) setState(() { _tags = t; _accounts = a; });
      } catch (_) {}
    });
  }

  Map<String, String> get _query {
    final chosen = widget.socialOnly && _channel != 'all' && _channel != 'friends' ? (_channel == 'live_chat' ? 'chat' : _channel) : widget.channel;
    final q = <String, String>{'folder': widget.folder, 'channel': chosen};
    if (_q.isNotEmpty) q['search'] = _q;
    if (_tag.isNotEmpty) q['tag'] = _tag;
    if (_account != null) q['account_id'] = '$_account';
    if (_chip == 'mine') {
      final id = context.read<Session>().userId;
      if (id != null) q['assignee'] = '$id';
    }
    return q;
  }

  bool _filter(Item c) {
    if (widget.socialOnly && c['channel'] == 'email') return false;
    if (widget.socialOnly && _channel == 'friends') return false; // the Friends chip shows only direct chats
    if (_chip == 'unread' && c['is_unread'] != true) return false;
    return true;
  }

  Future<void> _bulk(String action) async {
    final ids = _selected.toList();
    final ok = await run(context, (a) => a.post('inbox/bulk', {'ids': ids, 'action': action}), ok: 'Done');
    if (ok) {
      setState(() => _selected.clear());
      _key.currentState?.reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    final inTrash = widget.folder == 'trash';
    return PagedList(
      key: _key,
      endpoint: 'inbox/conversations',
      query: _query,
      filter: _filter,
      extraItems: widget.socialOnly ? _friendItems : null,
      compare: widget.socialOnly ? _byTime : null,
      beforeRefresh: () async { await Future.wait([_sync(), _loadFriends()]); },
      padding: const EdgeInsets.only(bottom: 96),
      emptyText: widget.socialOnly ? 'No chats yet.\nStart one with a friend (New chat), or connect WhatsApp, Telegram, SMS, Slack or Live chat under Workspace → Channels.' : (widget.channel != 'all' ? 'No conversations in this folder' : 'No conversations in this folder'),
      header: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: _selected.isNotEmpty
              ? Row(children: [
                  Text('${_selected.length} selected', style: const TextStyle(fontWeight: FontWeight.w700)),
                  const Spacer(),
                  if (!inTrash) IconButton(tooltip: 'Mark read', icon: const Icon(Icons.mark_email_read_outlined), onPressed: () => _bulk('mark_read')),
                  if (!inTrash) IconButton(tooltip: 'Star', icon: const Icon(Icons.star_outline_rounded), onPressed: () => _bulk('star')),
                  if (!inTrash) IconButton(tooltip: 'Archive', icon: const Icon(Icons.archive_outlined), onPressed: () => _bulk('archive')),
                  IconButton(tooltip: inTrash ? 'Delete forever' : 'Delete', icon: const Icon(Icons.delete_outline, color: AppColors.danger), onPressed: () async {
                    if (await confirmDialog(context, inTrash ? 'Delete forever?' : 'Move to bin?', '${_selected.length} conversation(s)', danger: true)) _bulk(inTrash ? 'force_delete' : 'delete');
                  }),
                  IconButton(tooltip: 'Close', icon: const Icon(Icons.close), onPressed: () => setState(() => _selected.clear())),
                ])
              : TextField(
                  controller: _ctrl,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (v) => setState(() => _q = v.trim()),
                  decoration: InputDecoration(
                    hintText: 'Search conversations',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _q.isEmpty ? null : IconButton(tooltip: 'Clear search', icon: const Icon(Icons.close), onPressed: () { _ctrl.clear(); setState(() => _q = ''); }),
                  ),
                ),
        ),
        if (widget.socialOnly)
          SizedBox(
            height: 50,
            child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.fromLTRB(16, 8, 16, 2), children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(label: const Text('All chats'), selected: _channel == 'all', showCheckmark: false, onSelected: (_) => setState(() => _channel = 'all')),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  avatar: const Icon(Icons.people_alt_rounded, size: 16, color: AppColors.primary),
                  label: const Text('Friends'),
                  selected: _channel == 'friends',
                  showCheckmark: false,
                  onSelected: (_) => setState(() => _channel = 'friends'),
                ),
              ),
              for (final ch in kChannels.where((x) => x.id != 'email'))
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    avatar: Icon(ch.icon, size: 16, color: ch.color),
                    label: Text(ch.label),
                    selected: _channel == ch.id,
                    showCheckmark: false,
                    onSelected: (_) => setState(() => _channel = ch.id),
                  ),
                ),
            ]),
          ),
        SizedBox(
          height: 52,
          child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.fromLTRB(16, 8, 16, 4), children: [
            for (final e in {'all': 'All', 'unread': 'Unread', 'mine': 'Assigned to me'}.entries)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(e.value, style: TextStyle(fontSize: 13, fontWeight: _chip == e.key ? FontWeight.w700 : FontWeight.w500, color: _chip == e.key ? AppColors.accentOf(context) : null)),
                  selected: _chip == e.key,
                  showCheckmark: false,
                  onSelected: (_) => setState(() => _chip = e.key),
                ),
              ),
            if (_accounts.length > 1)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: PopupMenuButton<int?>(
                  onSelected: (v) => setState(() => _account = v),
                  itemBuilder: (_) => [
                    const PopupMenuItem<int?>(value: null, child: Text('All accounts')),
                    for (final a in _accounts) PopupMenuItem<int?>(value: a['id'] as int, child: Text('${a['display_name']}')),
                  ],
                  child: Chip(avatar: const Icon(Icons.alternate_email, size: 14), label: Text(_account == null ? 'Accounts' : '${_accounts.firstWhere((a) => a['id'] == _account, orElse: () => {'display_name': 'Account'})['display_name']}', style: const TextStyle(fontSize: 12))),
                ),
              ),
            for (final t in _tags)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  avatar: const Icon(Icons.sell_outlined, size: 14),
                  label: Text('${t['name']}', style: const TextStyle(fontSize: 12)),
                  selected: _tag == t['name'],
                  onSelected: (s) => setState(() => _tag = s ? '${t['name']}' : ''),
                ),
              ),
          ]),
        ),
      ]),
      itemBuilder: (c, it, reload) {
        if (it['kind'] == 'friend') return _friendRow(c, it);
        final ch = channelById('${it['channel'] ?? 'email'}');
        final id = it['id'] as int;
        final unread = it['is_unread'] == true;
        final sel = _selected.contains(id);
        final name = '${it['contact_name'] ?? 'Unknown'}';
        final surface = Theme.of(c).colorScheme.surface;
        final accent = AppColors.accentOf(c);
        final hasMeta = (it['tags'] is List && (it['tags'] as List).isNotEmpty) || it['assigned_to_name'] != null || (it['priority'] == 'high' || it['priority'] == 'urgent');
        // Flat mail-style row: easy to scan, unread = bold + tinted background + accent time.
        return Material(
          color: sel ? AppColors.softOf(c) : (unread ? Color.alphaBlend(AppColors.primary.withValues(alpha: 0.05), surface) : surface),
          child: InkWell(
            onTap: () async {
              if (_selected.isNotEmpty) {
                setState(() => sel ? _selected.remove(id) : _selected.add(id));
                return;
              }
              await pushPage(c, ConversationDetailPage(id: id, summary: it, trashed: inTrash));
              reload();
            },
            onLongPress: () => setState(() => sel ? _selected.remove(id) : _selected.add(id)),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.borderOf(c)))),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(clipBehavior: Clip.none, children: [
                  sel ? const CircleAvatar(radius: 22, backgroundColor: AppColors.primary, child: Icon(Icons.check_rounded, color: Colors.white)) : Avatar(name, radius: 22),
                  if (ch.id != 'email') Positioned(right: -3, bottom: -3, child: Container(padding: const EdgeInsets.all(3), decoration: BoxDecoration(color: surface, shape: BoxShape.circle), child: Icon(ch.icon, size: 12, color: ch.color))),
                ]),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Expanded(child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, fontWeight: unread ? FontWeight.w800 : FontWeight.w600))),
                      const SizedBox(width: 8),
                      Text('${it['time'] ?? ''}', style: TextStyle(fontSize: 12, fontWeight: unread ? FontWeight.w700 : FontWeight.w400, color: unread ? accent : AppColors.muted)),
                    ]),
                    const SizedBox(height: 2),
                    Text('${it['subject'] ?? ''}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: unread ? FontWeight.w700 : FontWeight.w500)),
                    const SizedBox(height: 1),
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Expanded(child: Text(cleanPreview('${it['preview'] ?? ''}'), maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: AppColors.muted, height: 1.35))),
                      if (it['is_starred'] == true) const Padding(padding: EdgeInsets.only(left: 6, top: 1), child: Icon(Icons.star_rounded, size: 18, color: AppColors.warn)),
                      if (unread) Padding(padding: const EdgeInsets.only(left: 8, top: 5), child: Container(width: 9, height: 9, decoration: BoxDecoration(color: accent, shape: BoxShape.circle))),
                    ]),
                    if (hasMeta)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Wrap(spacing: 6, runSpacing: 4, children: [
                          if (it['priority'] == 'high' || it['priority'] == 'urgent') StatusChip('${it['priority']}', color: AppColors.danger),
                          if (it['assigned_to_name'] != null) StatusChip('→ ${it['assigned_to_name']}', color: AppColors.info),
                          for (final t in (it['tags'] as List? ?? []).take(3)) StatusChip('${t is Map ? t['name'] : t}'),
                        ]),
                      ),
                  ]),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}

// ───────────────────────────── Conversation detail ─────────────────────────────

class ConversationDetailPage extends StatefulWidget {
  final int id;
  final Item summary;
  final bool trashed;
  const ConversationDetailPage({super.key, required this.id, this.summary = const {}, this.trashed = false});
  @override
  State<ConversationDetailPage> createState() => _ConversationDetailPageState();
}

class _ConversationDetailPageState extends State<ConversationDetailPage> with ConversationVisibility<ConversationDetailPage> {
  Item _conv = {};
  List<Item> _msgs = [];
  final _full = <int, String>{};
  final _html = <int, String>{};
  final _atts = <int, List<Item>>{};
  bool _loading = true, _sending = false, _ai = false;
  String? _err, _summary;
  int? _selId; // e-mail reader: the message shown (null = the newest)
  final _htmlFailed = <int>{}, _htmlLoading = <int>{};
  final _reply = TextEditingController();
  final _scroll = ScrollController();
  Timer? _live;
  bool _ticking = false, _acknowledging = false;
  int _readThrough = 0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_acknowledgeVisible);
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
    _live = Timer.periodic(const Duration(seconds: 4), (_) => _liveTick());
  }

  @override
  void dispose() {
    _live?.cancel();
    _reply.dispose();
    _scroll.dispose();
    super.dispose();
  }

  /// Live chat: quietly re-reads the open conversation and appends new messages the moment they arrive
  /// (keeps your scroll position unless you are already at the bottom).
  Future<void> _liveTick() async {
    if (_ticking || _loading || _sending || !conversationVisible) return;
    final epoch = visibilityEpoch;
    afterVisibleFrame(_acknowledgeVisible);
    _ticking = true;
    try {
      final j = await Api.of(context).getNoCache('inbox/conversations/${widget.id}/messages', query: {'mark_read': '0'});
      final m = j is Map ? j : {};
      final fresh = Api.list(m['messages']);
      final oldLast = _msgs.isEmpty ? 0 : (_msgs.last['id'] as num?)?.toInt() ?? 0;
      final newLast = fresh.isEmpty ? 0 : (fresh.last['id'] as num?)?.toInt() ?? 0;
      if (!conversationVisible || epoch != visibilityEpoch || (fresh.length == _msgs.length && newLast == oldLast)) return;
      final atBottom = !_scroll.hasClients || _scroll.position.maxScrollExtent - _scroll.offset < 140;
      setState(() {
        _conv = m['conversation'] is Map ? Map<String, dynamic>.from(m['conversation']) : _conv;
        _msgs = fresh;
      });
      afterVisibleFrame(_acknowledgeVisible);
      _prefetchBodies();
      if (atBottom) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
        });
      }
    } catch (_) {
    } finally {
      _ticking = false;
    }
  }

  Future<void> _load() async {
    if (!conversationVisible) return;
    final epoch = visibilityEpoch;
    try {
      final api = Api.of(context);
      final j = await api.getNoCache('inbox/conversations/${widget.id}/messages', query: {'mark_read': '0'});
      final m = j is Map ? j : {};
      if (!conversationVisible || epoch != visibilityEpoch) return;
      setState(() {
        _conv = m['conversation'] is Map ? Map<String, dynamic>.from(m['conversation']) : {};
        _msgs = Api.list(m['messages']);
        _loading = false;
      });
      afterVisibleFrame(_acknowledgeVisible);
      _prefetchBodies();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scroll.hasClients) _scroll.jumpTo(_scroll.position.maxScrollExtent);
      });
    } on ApiException catch (e) {
      if (mounted) setState(() { _err = e.message; _loading = false; });
    }
  }

  @override
  void onConversationVisibilityChanged(bool visible) {
    if (visible) afterVisibleFrame(() { if (_loading) { _load(); } else { _liveTick(); } });
  }

  Future<void> _acknowledgeVisible() async {
    if (!conversationVisible || widget.trashed || _msgs.isEmpty || _acknowledging) return;
    if (_scroll.hasClients && _scroll.position.maxScrollExtent - _scroll.offset >= 140) return;
    final through = _msgs.map((m) => (m['id'] as num?)?.toInt() ?? 0).reduce((a, b) => a > b ? a : b);
    if (through <= _readThrough) return;
    _acknowledging = true;
    try {
      await Api.of(context).post('inbox/conversations/${widget.id}/action', {'action': 'mark_read', 'through_message_id': through});
      _readThrough = through;
      AppRefresh.bump();
    } catch (_) { /* Retry only while this conversation is visible. */ }
    finally { _acknowledging = false; }
  }

  /// Loads the formatted (HTML) body and attachment list of the latest email messages.
  Future<void> _prefetchBodies() async {
    final mails = _msgs.where((m) => '${m['channel'] ?? _conv['channel'] ?? 'email'}' == 'email').toList();
    final recent = mails.length > 3 ? mails.sublist(mails.length - 3) : mails;
    for (final m in recent) {
      await _ensureBody(m['id'] as int); // cache-first; older messages load when you pick them
    }
  }

  Future<void> _loadFull(int mid) async {
    try {
      final j = await Api.of(context).get('inbox/messages/$mid/body');
      final t = '${Api.obj(j)['text'] ?? ''}';
      if (mounted) setState(() => _full[mid] = t);
    } on ApiException catch (e) {
      if (mounted) toast(context, e.message, error: true);
    }
  }

  Future<void> _send() async {
    final t = _reply.text.trim();
    if (t.isEmpty) return;
    setState(() => _sending = true);
    final ok = await run(context, (a) => a.post('inbox/conversations/${widget.id}/send', {'body': t, 'mode': 'reply'}), ok: '*');
    if (ok) {
      _reply.clear();
      await _load();
    }
    if (mounted) setState(() => _sending = false);
  }

  bool get _isEmailConv => '${_conv['channel'] ?? widget.summary['channel'] ?? 'email'}' == 'email';

  Future<void> _compose(String mode, {String? draft}) async {
    final subj = '${_conv['subject'] ?? widget.summary['subject'] ?? ''}';
    final who = pick(_conv, ['contact_email', 'email'], fallback: pick(widget.summary, ['contact_email', 'contact_name']));
    final sent = await pushPage<bool>(context, ComposePage(conversationId: widget.id, mode: mode, subject: subj, replyTo: who, prefill: draft));
    if (sent == true && mounted) await _load();
  }

  Future<void> _aiThenReply() async {
    await _aiSuggest();
    if (mounted && _reply.text.trim().isNotEmpty) {
      final d = _reply.text;
      _reply.clear();
      await _compose('reply', draft: d);
    }
  }

  Future<void> _aiSuggest() async {
    final lastIn = _msgs.lastWhere((m) => m['direction'] == 'inbound', orElse: () => <String, dynamic>{});
    if (lastIn.isEmpty) return toast(context, 'No customer message to reply to');
    setState(() => _ai = true);
    try {
      final j = await Api.of(context).post('ai/generate-reply', {
        'message': _full[lastIn['id']] ?? '${lastIn['body_text']}',
        'subject': '${_conv['subject'] ?? ''}',
        'sender_name': '${lastIn['sender_name'] ?? ''}',
        'conversation_history': [for (final m in _msgs.take(20)) {'role': m['direction'] == 'outbound' ? 'assistant' : 'user', 'content': '${m['body_text']}'}],
      });
      final o = Api.obj(j);
      final r = pick(o, ['reply', 'response', 'content', 'text', 'message']);
      if (r.isNotEmpty) {
        _reply.text = r;
      } else if (mounted) {
        toast(context, 'AI returned no text');
      }
    } on ApiException catch (e) {
      if (mounted) toast(context, e.message, error: true);
    } finally {
      if (mounted) setState(() => _ai = false);
    }
  }

  Future<void> _summarize() async {
    try {
      final j = await Api.of(context).post('inbox/conversations/${widget.id}/summarize');
      if (mounted) setState(() => _summary = '${(j is Map ? j['summary'] : null) ?? 'No summary'}');
    } on ApiException catch (e) {
      if (mounted) toast(context, e.message, error: true);
    }
  }

  Future<void> _act(String action, {Map<String, dynamic>? extra, bool pop = false, String? msg}) async {
    final ok = await run(context, (a) => a.post('inbox/conversations/${widget.id}/action', {'action': action, ...?extra}), ok: msg ?? 'Done');
    if (!ok || !mounted) return;
    if (pop) {
      Navigator.of(context).pop();
    } else {
      await _load();
    }
  }

  Future<void> _assign() async {
    final team = Api.list(await Api.of(context).get('inbox/team'));
    if (!mounted) return;
    actionSheet(context, 'Assign to', [
      for (final u in team) SheetAction('${u['name']}', Icons.person_outline, () => _act('assign', extra: {'user_id': u['id']}, msg: 'Assigned')),
      SheetAction('Unassign', Icons.person_off_outlined, () => _act('assign', extra: {'user_id': null}, msg: 'Unassigned')),
    ]);
  }

  Future<void> _tagSheet() async {
    final all = Api.list(await Api.of(context).get('inbox/tags'));
    final have = (_conv['tags'] as List? ?? []).map((t) => t is Map ? t['id'] : null).toSet();
    if (!mounted) return;
    actionSheet(context, 'Tags', [
      for (final t in all)
        SheetAction(have.contains(t['id']) ? 'Remove: ${t['name']}' : 'Add: ${t['name']}', have.contains(t['id']) ? Icons.label_off_outlined : Icons.label_outline,
            () => _act(have.contains(t['id']) ? 'remove_tag' : 'add_tag', extra: {'tag_id': t['id']}, msg: 'Updated')),
      SheetAction('Create new tag', Icons.add, () async {
        final n = await promptDialog(context, 'New tag', hint: 'Tag name');
        if (n == null || !mounted) return;
        try {
          final j = await Api.of(context).post('tag-create', {'name': n});
          await _act('add_tag', extra: {'tag_id': Api.obj(j)['id']}, msg: 'Tag added');
        } on ApiException catch (e) {
          if (mounted) toast(context, e.message, error: true);
        }
      }),
    ]);
  }

  void _more() {
    final starred = _conv['is_starred'] == true;
    final closed = _conv['status'] == 'closed';
    actionSheet(context, '${_conv['subject'] ?? 'Conversation'}', [
      SheetAction(starred ? 'Remove star' : 'Star', starred ? Icons.star_outline_rounded : Icons.star_rounded, () => _act('star')),
      SheetAction('Mark unread', Icons.mark_email_unread_outlined, () => _act('mark_unread', pop: true)),
      SheetAction('Assign…', Icons.person_add_alt_1_outlined, _assign),
      SheetAction('Tags…', Icons.sell_outlined, _tagSheet),
      SheetAction('Priority…', Icons.flag_outlined, () => actionSheet(context, 'Priority', [
            for (final p in ['low', 'normal', 'high', 'urgent']) SheetAction(p[0].toUpperCase() + p.substring(1), Icons.flag_outlined, () => _act('priority', extra: {'value': p})),
          ])),
      SheetAction('Snooze…', Icons.schedule_rounded, () => actionSheet(context, 'Snooze until', [
            for (final e in {'1h': 'In 1 hour', '3h': 'In 3 hours', 'tomorrow': 'Tomorrow 9:00', 'next_week': 'Next Monday 9:00'}.entries) SheetAction(e.value, Icons.schedule_rounded, () => _act('snooze', extra: {'duration': e.key}, pop: true, msg: 'Snoozed')),
          ])),
      SheetAction(closed ? 'Reopen' : 'Close / archive', closed ? Icons.unarchive_outlined : Icons.archive_outlined, () => _act(closed ? 'reopen' : 'close', pop: !closed)),
      SheetAction('Mark as spam', Icons.report_gmailerrorred_outlined, () => _act('spam', pop: true), danger: true),
      if (widget.trashed) SheetAction('Restore from bin', Icons.restore_from_trash_outlined, () => _act('restore', pop: true)),
      SheetAction(widget.trashed ? 'Delete forever' : 'Move to bin', Icons.delete_outline, () async {
        if (await confirmDialog(context, widget.trashed ? 'Delete forever?' : 'Move to bin?', 'This conversation will be ${widget.trashed ? 'permanently deleted' : 'moved to the bin'}.', danger: true)) {
          await _act(widget.trashed ? 'force_delete' : 'trash', pop: true);
        }
      }, danger: true),
    ]);
  }

  Future<void> _quick() async {
    try {
      final rows = Api.list(await Api.of(context).get('quick-replies'));
      if (!mounted) return;
      if (rows.isEmpty) return toast(context, 'No quick replies yet');
      actionSheet(context, 'Quick replies', [
        for (final r in rows) SheetAction('${r['title']}', Icons.bolt_rounded, () => setState(() => _reply.text = '${r['content']}')),
      ]);
    } on ApiException catch (e) {
      if (mounted) toast(context, e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ch = channelById('${_conv['channel'] ?? widget.summary['channel'] ?? 'email'}');
    // Newest received message: fallback for automated senders (no contact record, e.g. noreply@…).
    Item? lastIn;
    for (final x in _msgs.reversed) {
      if (x['direction'] == 'inbound') { lastIn = x; break; }
    }
    String clean(dynamic v) => '${v ?? ''}'.trim();
    final title = [clean(_conv['contact_name']), clean(widget.summary['contact_name']), clean(lastIn?['from_name']), clean(lastIn?['sender_name']), clean(lastIn?['from_email'])].firstWhere((e) => e.isNotEmpty, orElse: () => 'Conversation');
    final address = [clean(_conv['contact_email']), clean(widget.summary['contact_email']), clean(lastIn?['from_email'])].firstWhere((e) => e.isNotEmpty, orElse: () => '');
    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          // e-mail address under the name; for chat channels without one, show the channel instead
          Text(address.isNotEmpty && address != title ? address : ch.label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12.5, color: AppColors.muted, fontWeight: FontWeight.w400)),
        ]),
        actions: [
          IconButton(tooltip: 'AI recap', icon: const Icon(Icons.auto_awesome_outlined), onPressed: _summarize),
          IconButton(tooltip: 'More options', icon: const Icon(Icons.more_vert), onPressed: _more),
        ],
      ),
      body: Column(children: [
        if (_summary != null)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.primarySoft, borderRadius: BorderRadius.circular(14)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.auto_awesome, size: 18, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(child: Text(_summary!, style: const TextStyle(color: AppColors.ink, fontSize: 13))),
              InkWell(onTap: () => setState(() => _summary = null), child: const Icon(Icons.close, size: 16, color: AppColors.muted)),
            ]),
          ),
        if ((_conv['tags'] as List? ?? []).isNotEmpty || _conv['assigned_to'] != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(spacing: 6, runSpacing: 4, children: [
                if (_conv['assigned_to'] != null) StatusChip('→ ${_conv['assigned_to']}', color: AppColors.info),
                if (_conv['status'] != null) StatusChip('${_conv['status']}'),
                for (final t in (_conv['tags'] as List? ?? [])) StatusChip('${t is Map ? t['name'] : t}'),
              ]),
            ),
          ),
        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _err != null
                  ? EmptyState(icon: Icons.error_outline, text: _err!, action: 'Retry', onAction: _load)
                  : (_isEmailConv
                      ? _emailReader(context)
                      : ListView.builder(
                          controller: _scroll,
                          padding: const EdgeInsets.all(14),
                          itemCount: _msgs.length,
                          itemBuilder: (c, i) => _bubble(c, _msgs[i]),
                        )),
        ),
        if (!widget.trashed && _isEmailConv)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
              child: Row(children: [
                // Compact buttons: small side padding + single-line scaled label, so "Reply all" never wraps to two lines.
                Expanded(child: FilledButton.icon(style: FilledButton.styleFrom(minimumSize: const Size(0, 46), padding: const EdgeInsets.symmetric(horizontal: 6), tapTargetSize: MaterialTapTargetSize.shrinkWrap), icon: const Icon(Icons.reply_rounded, size: 18), label: const FittedBox(fit: BoxFit.scaleDown, child: Text('Reply', maxLines: 1, softWrap: false)), onPressed: () => _compose('reply'))),
                const SizedBox(width: 6),
                Expanded(child: OutlinedButton.icon(style: OutlinedButton.styleFrom(minimumSize: const Size(0, 46), padding: const EdgeInsets.symmetric(horizontal: 6), tapTargetSize: MaterialTapTargetSize.shrinkWrap), icon: const Icon(Icons.reply_all_rounded, size: 18), label: const FittedBox(fit: BoxFit.scaleDown, child: Text('Reply all', maxLines: 1, softWrap: false)), onPressed: () => _compose('reply_all'))),
                const SizedBox(width: 6),
                Expanded(child: OutlinedButton.icon(style: OutlinedButton.styleFrom(minimumSize: const Size(0, 46), padding: const EdgeInsets.symmetric(horizontal: 6), tapTargetSize: MaterialTapTargetSize.shrinkWrap), icon: const Icon(Icons.forward_rounded, size: 18), label: const FittedBox(fit: BoxFit.scaleDown, child: Text('Forward', maxLines: 1, softWrap: false)), onPressed: () => _compose('forward'))),
                IconButton(tooltip: 'AI suggested reply', onPressed: _ai ? null : _aiThenReply, icon: _ai ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.auto_awesome_rounded, color: AppColors.primary)),
              ]),
            ),
          )
        else if (!widget.trashed)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                IconButton(tooltip: 'Quick replies', onPressed: _quick, icon: const Icon(Icons.bolt_rounded, color: AppColors.primary)),
                IconButton(tooltip: 'AI suggested reply', onPressed: _ai ? null : _aiSuggest, icon: _ai ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.auto_awesome_rounded, color: AppColors.primary)),
                Expanded(child: TextField(controller: _reply, minLines: 1, maxLines: 6, decoration: const InputDecoration(hintText: 'Write a reply…'))),
                const SizedBox(width: 6),
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: _sending ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : IconButton(tooltip: 'Send', icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20), onPressed: _send),
                ),
              ]),
            ),
          ),
      ]),
    );
  }

  /// Loads the formatted body (and attachment list) of one e-mail when it is opened.
  Future<void> _ensureBody(int id) async {
    if (_html.containsKey(id) || _htmlFailed.contains(id) || _htmlLoading.contains(id)) return;
    _htmlLoading.add(id);
    void apply(Map<String, dynamic> o) {
      if (!mounted) return;
      setState(() {
        _html[id] = '${o['html'] ?? ''}';
        final t = '${o['text'] ?? ''}';
        if (t.isNotEmpty) _full[id] ??= t;
        _atts[id] = Api.list(o['attachments']).where((a) => a['inline'] != true).toList();
      });
    }

    try {
      // 1. Already opened before? An e-mail body never changes, so show the saved copy at once – no download at all.
      //    (Image links inside stay valid for 7+ days, so copies older than 4 days are fetched again.)
      final saved = Api.peek('inbox/messages/$id/body');
      if (saved != null) {
        final o = Api.obj(saved);
        final at = o['_at'] is int ? o['_at'] as int : 0;
        if (DateTime.now().millisecondsSinceEpoch - at < const Duration(days: 4).inMilliseconds) {
          apply(o);
          return;
        }
      }
      // 2. First time: download once and remember it.
      final raw = await Api.of(context).get('inbox/messages/$id/body');
      if (raw is Map && raw['data'] is Map) (raw['data'] as Map)['_at'] = DateTime.now().millisecondsSinceEpoch;
      apply(Api.obj(raw));
    } catch (_) {
      if (mounted) setState(() => _htmlFailed.add(id));
    } finally {
      _htmlLoading.remove(id);
    }
  }

  /// Pull-to-reload / Reload button: download the e-mail again (fresh image links) and show it.
  Future<void> _reloadBody(int id) async {
    if (!mounted) return;
    Api.forget('inbox/messages/$id/body'); // force a fresh download
    setState(() { _html.remove(id); _htmlFailed.remove(id); });
    await _ensureBody(id);
  }

  /// E-mail conversations: the message is shown in the full browser-style view (layout + images), like a mail app.
  Widget _emailReader(BuildContext c) {
    if (_msgs.isEmpty) return const EmptyState(icon: Icons.mail_outline_rounded, text: 'No messages');
    final sel = _msgs.firstWhere((m) => m['id'] == _selId, orElse: () => _msgs.last);
    final id = sel['id'] as int;
    final note = sel['type'] == 'note' || sel['type'] == 'internal_note';
    final out = sel['direction'] == 'outbound';
    final html = (_html[id] ?? '').trim();
    final loadingBody = !_html.containsKey(id) && !_htmlFailed.contains(id);
    if (loadingBody) WidgetsBinding.instance.addPostFrameCallback((_) => _ensureBody(id));
    final name = '${sel['sender_name'] ?? sel['from_name'] ?? ''}'.trim().isEmpty ? '${sel['from_email'] ?? ''}' : '${sel['sender_name'] ?? sel['from_name']}';
    final to = sel['to_emails'];
    final toText = to is List ? to.map((e) => e is Map ? '${e['email'] ?? e['address'] ?? ''}' : '$e').where((e) => e.isNotEmpty).join(', ') : '${to ?? ''}';
    final atts = (_atts[id] ?? const <Item>[]);
    String short(Item m) {
      final n = m['direction'] == 'outbound' ? 'You' : '${m['sender_name'] ?? m['from_name'] ?? ''}'.trim().split(' ').first;
      return '${n.isEmpty ? 'Message' : n} · ${m['time'] ?? ''}';
    }

    return Column(children: [
      if (_msgs.length > 1)
        SizedBox(
          height: 52,
          child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.fromLTRB(12, 8, 12, 4), children: [
            for (final m in _msgs)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(short(m), style: const TextStyle(fontSize: 13)),
                  selected: m['id'] == sel['id'],
                  showCheckmark: false,
                  onSelected: (_) => setState(() => _selId = identical(m, _msgs.last) ? null : m['id'] as int),
                ),
              ),
          ]),
        ),
      // ── message header: who, address, to, date ──
      Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
        decoration: BoxDecoration(color: Theme.of(c).colorScheme.surface, border: Border(bottom: BorderSide(color: AppColors.borderOf(c)))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Avatar(name.isEmpty ? '?' : name, radius: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(note ? 'Internal note · $name' : (name.isEmpty ? 'Unknown sender' : name), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                if ('${sel['from_email'] ?? ''}'.isNotEmpty && '${sel['from_email']}' != name) Text('${sel['from_email']}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12.5, color: AppColors.muted)),
                if (toText.isNotEmpty) Text('To: $toText', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12.5, color: AppColors.muted)),
              ]),
            ),
            const SizedBox(width: 8),
            Text('${sel['date'] ?? sel['time'] ?? ''}'.replaceAll(' at ', '\n'), textAlign: TextAlign.right, style: const TextStyle(fontSize: 11.5, color: AppColors.muted, height: 1.3)),
          ]),
          if (out) const Padding(padding: EdgeInsets.only(top: 6), child: StatusChip('Sent by you')),
          if (atts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Wrap(spacing: 8, runSpacing: 4, children: [
                for (final a in atts)
                  ActionChip(
                    avatar: const Icon(Icons.attach_file_rounded, size: 16),
                    label: Text('${a['filename']} (${a['size_human']})', style: const TextStyle(fontSize: 12.5)),
                    onPressed: () => openAttachment(c, a['id'] as int, '${a['filename']}'),
                  ),
              ]),
            ),
        ]),
      ),
      // ── body ──
      Expanded(
        child: note
            ? SingleChildScrollView(padding: const EdgeInsets.all(16), child: SelectableText('${_full[id] ?? sel['body_text'] ?? ''}', style: const TextStyle(height: 1.45)))
            : loadingBody
                ? const Center(child: CircularProgressIndicator())
                : html.isNotEmpty
                    ? EmailWebBody(key: ValueKey('mail$id'), html: html, onReload: () => _reloadBody(id))
                    : SingleChildScrollView(padding: const EdgeInsets.all(16), child: SelectableText('${_full[id] ?? sel['body_text'] ?? ''}'.trim().isEmpty ? '(No content)' : '${_full[id] ?? sel['body_text']}', style: const TextStyle(fontSize: 15, height: 1.5))),
      ),
    ]);
  }

  Widget _bubble(BuildContext c, Item m) {
    final out = m['direction'] == 'outbound';
    final note = m['type'] == 'note' || m['type'] == 'internal_note';
    final id = m['id'] as int;
    final text = _full[id] ?? '${m['body_text'] ?? ''}';
    final long = _full[id] == null && (_html[id] ?? '').isEmpty && text.length >= 495;
    final atts = (m['attachments'] as List? ?? []).whereType<Map>().toList();
    // HTML e-mails are rendered in the separate reader; these are text bubbles.
    final bg = note ? const Color(0xFFFFF4CC) : (out ? AppColors.primary : Theme.of(c).colorScheme.surface);
    final fg = note ? AppColors.ink : (out ? Colors.white : null);
    return Align(
      alignment: out ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(c).size.width * 0.86),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.only(topLeft: const Radius.circular(16), topRight: const Radius.circular(16), bottomLeft: Radius.circular(out ? 16 : 4), bottomRight: Radius.circular(out ? 4 : 16)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(note ? 'Internal note · ${m['sender_name']}' : '${m['sender_name'] ?? ''}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: out && !note ? Colors.white70 : AppColors.primary)),
          if ('${m['subject'] ?? ''}'.isNotEmpty && !out && '${m['subject']}' != '${_conv['subject']}') Text('${m['subject']}', style: TextStyle(fontWeight: FontWeight.w600, color: fg)),
          const SizedBox(height: 4),
          SelectableText(text, style: TextStyle(color: fg, height: 1.35)),
          if (long) TextButton(onPressed: () => _loadFull(id), style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 30), foregroundColor: out ? Colors.white : AppColors.primary), child: const Text('Show full message')),
          for (final a in (_atts[id] ?? const <Item>[]))
            InkWell(
              onTap: () => openAttachment(c, a['id'] as int, '${a['filename']}'),
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.attach_file, size: 16, color: fg ?? AppColors.primary),
                  const SizedBox(width: 4),
                  Flexible(child: Text('${a['filename']} (${a['size_human']})', style: TextStyle(fontSize: 12, decoration: TextDecoration.underline, color: fg))),
                ]),
              ),
            ),
          if ((_atts[id] ?? const <Item>[]).isEmpty)
            for (final a in atts)
            InkWell(
              onTap: () => openUrl('${a['url']}'),
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.attach_file, size: 16, color: fg ?? AppColors.primary),
                  const SizedBox(width: 4),
                  Flexible(child: Text('${a['filename']} (${a['size']})', style: TextStyle(fontSize: 12, decoration: TextDecoration.underline, color: fg))),
                ]),
              ),
            ),
          const SizedBox(height: 4),
          Text('${m['date'] ?? m['time'] ?? ''}${m['delivery_status'] != null && out ? ' · ${m['delivery_status']}' : ''}', style: TextStyle(fontSize: 10, color: out && !note ? Colors.white70 : AppColors.muted)),
        ]),
      ),
    );
  }
}

// ───────────────────────────── Quick replies manager ─────────────────────────────

class QuickRepliesPage extends StatefulWidget {
  const QuickRepliesPage({super.key});
  @override
  State<QuickRepliesPage> createState() => _QuickRepliesPageState();
}

class _QuickRepliesPageState extends State<QuickRepliesPage> {
  final _k = GlobalKey<PagedListState>();

  Future<void> _edit(Item? r) async {
    final ok = await showBodySheet<bool>(context, r == null ? 'New quick reply' : 'Edit quick reply', _QuickReplyForm(item: r));
    if (ok == true) _k.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) {
    return PagedList(
      key: _k,
      endpoint: 'quick-replies',
      emptyText: 'No quick replies yet.\nSave common answers to reuse them in one tap.',
      emptyIcon: Icons.bolt_rounded,
      itemBuilder: (c, r, reload) => ListRow(
        icon: Icons.bolt_rounded,
        title: '${r['title']}${'${r['shortcut'] ?? ''}'.isEmpty ? '' : '  ·  /${r['shortcut']}'}',
        subtitle: '${r['content']}',
        onTap: () => _edit(r),
        trailing: IconButton(tooltip: 'Delete', 
          icon: const Icon(Icons.delete_outline, color: AppColors.danger),
          onPressed: () async {
            if (await confirmDialog(c, 'Delete quick reply?', '${r['title']}', danger: true) && c.mounted) {
              await run(c, (a) => a.delete('quick-replies/${r['id']}'), ok: 'Deleted');
              await reload();
            }
          },
        ),
      ),
      fab: fabAdd('New reply', () => _edit(null)),
    );
  }
}

class _QuickReplyForm extends StatelessWidget {
  final Item? item;
  const _QuickReplyForm({this.item});
  @override
  Widget build(BuildContext context) {
    return FormBody(
      scroll: true,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      initial: item ?? const {},
      fields: const [
        F('title', 'Title', required: true),
        F('shortcut', 'Shortcut', hint: 'e.g. thanks'),
        F('content', 'Reply text', type: FT.multiline, required: true),
        F('category', 'Category'),
        F('scope', 'Visible to', type: FT.dropdown, options: [('team', 'Whole team'), ('personal', 'Only me')]),
      ],
      onSubmit: (v) async {
        final api = Api.of(context);
        if (item == null) {
          await api.post('quick-replies', v);
        } else {
          await api.put('quick-replies/${item!['id']}', v);
        }
        if (context.mounted) Navigator.pop(context, true);
      },
    );
  }
}
