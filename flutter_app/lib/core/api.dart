import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'refresh.dart';
import 'package:provider/provider.dart';
import 'config.dart';
import 'device_env.dart';
import 'session.dart';

class ApiException implements Exception {
  final int status;
  final String message;
  ApiException(this.status, this.message);
  bool get notFound => status == 404 || status == 405;
  @override
  String toString() => message;
}

/// Thin client for the Laravel Sanctum REST API at /api/v1.
/// Thrown by a cache-only Api when a request has not been made before.
class CacheMiss implements Exception {}

class Api {
  final Session session;
  /// When true, GETs are answered from memory only (used to paint screens instantly), never from the network.
  final bool cacheOnly;
  Api(this.session, {this.cacheOnly = false});

  static final Map<String, dynamic> _cache = {};

  /// Drops everything in memory (used after big changes such as connecting an account).
  static void clearCache() {
    _cache.clear();
    _scheduleSave();
  }

  // ── Persistent cache: lists / settings are shown instantly at the next start, then refreshed silently ──
  static String? _userKey;
  static Timer? _saveTimer;

  static Future<File?> _cacheFile() async {
    if (_userKey == null) return null;
    final d = await getApplicationSupportDirectory(); // app-private folder
    return File('${d.path}/apicache_$_userKey.json');
  }

  /// Loads the saved cache for this user (call once after sign-in / at start, before the first screen builds).
  static Future<void> initCache(String userKey) async {
    if (_userKey == userKey) return;
    _userKey = userKey;
    try {
      final f = await _cacheFile();
      if (f != null && await f.exists()) {
        final m = jsonDecode(await f.readAsString());
        if (m is Map) m.forEach((k, v) => _cache.putIfAbsent('$k', () => v));
      }
    } catch (_) {}
  }

  static void _scheduleSave() {
    if (_userKey == null) return;
    _saveTimer?.cancel();
    _saveTimer = Timer(const Duration(seconds: 3), _save);
  }

  static Future<void> _save() async {
    try {
      final f = await _cacheFile();
      if (f == null) return;
      final out = <String, dynamic>{};
      var size = 0;
      for (final e in _cache.entries.toList().reversed) {
        // Live message lists always come fresh; an e-mail BODY never changes, so it is kept (opens instantly next time).
        if (e.key.startsWith('inbox/conversations/') && e.key.contains('/messages')) continue;
        final s = jsonEncode(e.value);
        if (s.length > 150000) continue;
        size += s.length;
        if (size > 3000000) break;
        out[e.key] = e.value;
      }
      await f.writeAsString(jsonEncode(out), flush: true);
    } catch (_) {}
  }

  /// Size of the saved-data file on this phone (bytes).
  static Future<int> savedBytes() async {
    try {
      final f = await _cacheFile();
      return f != null && await f.exists() ? await f.length() : 0;
    } catch (_) {
      return 0;
    }
  }

  /// "Clear saved data" in Settings: empties memory and the file, but keeps saving new data afterwards.
  static Future<void> clearSaved() async {
    _saveTimer?.cancel();
    _cache.clear();
    try {
      final f = await _cacheFile();
      if (f != null && await f.exists()) await f.delete();
    } catch (_) {}
  }

  /// Sign-out: forget everything, including the file on disk.
  static Future<void> wipeCache() async {
    _saveTimer?.cancel();
    _cache.clear();
    try {
      final f = await _cacheFile();
      if (f != null && await f.exists()) await f.delete();
    } catch (_) {}
    _userKey = null;
  }

  // ── Scoped invalidation: a change only refreshes the screens it can affect (it used to wipe EVERYTHING) ──
  static const _settingsCluster = {'email-accounts', 'channels', 'integrations', 'ai-config', 'auto-reply-rules', 'workspace', 'workspaces', 'team', 'billing', 'webhook-logs', 'checkout', 'payments'};
  static const _contactFamily = {'contacts', 'contact-groups', 'contact-trash', 'contact-duplicates', 'deals', 'pipelines'};

  static void _invalidate(String path) {
    // Phone / discovery changes only affect the Friends screen – not everything else.
    if (path.startsWith('me/phone')) {
      _cache.removeWhere((k, _) => k.startsWith('friends'));
      _scheduleSave();
      return;
    }
    final seg = path.split('?').first.split('/').first;
    if (seg == 'workspaces' || seg == 'auth' || seg == 'me') {
      _cache.clear(); // switching workspace / account changes everything
      _lastSync = null;
      AppRefresh.bump();
    } else {
      final drop = <String>{seg, 'analytics', 'activity', 'notifications'};
      if (seg == 'inbox') drop.addAll({'contacts', 'quick-replies'});
      if (_contactFamily.contains(seg)) drop.addAll(_contactFamily);
      if (_settingsCluster.contains(seg)) drop.addAll(_settingsCluster);
      _cache.removeWhere((k, _) => drop.contains(k.split('?').first.split('/').first));
    }
    _scheduleSave();
  }

  static DateTime? _lastSync;
  static bool _syncing = false;

  /// "Sync ahead" (like Facebook / Gmail): downloads the data of EVERY screen in the background – most-used first,
  /// four requests at a time – so tapping a menu item shows its content immediately. Runs right after start,
  /// and again (silently) when you return to the app after a while. Everything is saved to the phone.
  static Future<void> prefetch(Session session, {bool force = false}) async {
    if (_syncing) return;
    if (!force && _lastSync != null && DateTime.now().difference(_lastSync!).inSeconds < 90) return;
    _syncing = true;
    try {
      final api = Api(session);
      const p1 = {'page': '1'};
      // (endpoint, query). Screens built from a paged list use ?page=1; detail/forms call the plain path – both are warmed.
      const jobs = <(String, Map<String, String>?)>[
        ('analytics/overview', null), ('dashboard/insights', null), ('notifications', null), ('notifications', p1),
        ('inbox/conversations', {'folder': 'inbox', 'channel': 'email', 'page': '1'}),
        ('inbox/sidebar', null), ('inbox/accounts', null), ('inbox/tags', null), ('tags', null),
        ('inbox/conversations', {'folder': 'inbox', 'channel': 'all', 'page': '1'}),
        ('workspace', null), ('workspaces', null), ('me', null), ('friends', null),
        ('contacts', {'per_page': '30', 'page': '1'}), ('contact-groups', null), ('contact-groups', p1),
        ('pipelines', null), ('campaigns', p1), ('workflows', p1), ('workflow-catalog', null),
        ('knowledge-base', p1), ('quick-replies', null), ('quick-replies', p1),
        ('email-accounts', null), ('email-accounts', p1), ('channels', null), ('integrations', null),
        ('ai-config', null), ('auto-reply-rules', p1), ('team', null), ('billing', null), ('checkout/gateways', null),
        ('me/notification-preferences', null), ('me/sessions', null), ('me/security-log', null),
        ('workspace/settings', null), ('workspace/contact-settings', null), ('workspace/privacy', null),
        ('analytics/ai', null), ('analytics/team', null), ('activity', p1),
        ('help/articles', null), ('help/articles', p1), ('email-templates', p1), ('temp-mail-domains', null),
        ('contact-duplicates', null), ('contact-trash', p1), ('campaign-audiences', null), ('webhook-logs', p1),
      ];
      final queue = List.of(jobs);
      Future<void> worker() async {
        while (queue.isNotEmpty) {
          final j = queue.removeAt(0);
          await api.get(j.$1, query: j.$2).then<void>((_) {}, onError: (_) {});
        }
      }

      await Future.wait([for (var i = 0; i < 4; i++) worker()]);

      // The deals board of the first pipeline (its id is only known now).
      try {
        final pl = Api.list(peek('pipelines'));
        if (pl.isNotEmpty) await api.get('deals', query: {'pipeline_id': '${pl.first['id']}'}).then<void>((_) {}, onError: (_) {});
      } catch (_) {}
      _lastSync = DateTime.now();
    } finally {
      _syncing = false;
    }
  }
  static String _ck(String path, Map<String, String>? q) {
    if (q == null || q.isEmpty) return path;
    final keys = q.keys.toList()..sort();
    return '$path?${keys.map((k) => '$k=${q[k]}').join('&')}';
  }
  static dynamic peek(String path, [Map<String, String>? q]) => _cache[_ck(path, q)];
  /// Removes one saved response (e.g. to force a fresh download of an e-mail).
  static void forget(String path, [Map<String, String>? q]) {
    _cache.remove(_ck(path, q));
    _scheduleSave();
  }
  factory Api.of(BuildContext c) => Api(c.read<Session>());

  Uri _u(String path, [Map<String, String>? q]) {
    final uri = Uri.parse('${AppConfig.apiBase}/$path');
    return (q == null || q.isEmpty) ? uri : uri.replace(queryParameters: q);
  }

  Future<dynamic> get(String path, {Map<String, String>? query}) async {
    final key = _ck(path, query);
    if (cacheOnly) {
      if (_cache.containsKey(key)) return _cache[key];
      throw CacheMiss();
    }
    final data = await _send('GET', path, query: query);
    if (_cache.length > 300) _cache.remove(_cache.keys.first);
    _cache[key] = data;
    _scheduleSave();
    return data;
  }
  Future<dynamic> post(String path, [Object? body]) async { if (cacheOnly) throw CacheMiss(); final r = await _send('POST', path, body: body ?? {}); _invalidate(path); return r; }
  Future<dynamic> put(String path, [Object? body]) async { if (cacheOnly) throw CacheMiss(); final r = await _send('PUT', path, body: body ?? {}); _invalidate(path); return r; }
  Future<dynamic> delete(String path) async { if (cacheOnly) throw CacheMiss(); final r = await _send('DELETE', path); _invalidate(path); return r; }

  /// GET that is never cached – for polling (calls, new messages).
  Future<dynamic> getNoCache(String path, {Map<String, String>? query}) => _send('GET', path, query: query);

  /// multipart/form-data POST (avatar / logo uploads).
  Future<dynamic> multipart(String path, Map<String, String> fields, {String? fileField, String? filePath}) async {
    final req = http.MultipartRequest('POST', _u(path));
    req.headers.addAll({'Accept': 'application/json', if (DeviceEnv.cached != null) 'X-Timezone': DeviceEnv.cached!, if (session.token != null) 'Authorization': 'Bearer ${session.token}'});
    req.fields.addAll(fields);
    if (fileField != null && filePath != null && File(filePath).existsSync()) {
      req.files.add(await http.MultipartFile.fromPath(fileField, filePath));
    }
    try {
      final res = await http.Response.fromStream(await req.send().timeout(const Duration(seconds: 60)));
      final dynamic data = res.body.isEmpty ? null : _tryDecode(res.body);
      if (res.statusCode == 401) {
        session.signOut(remote: false);
        throw ApiException(401, 'Session expired. Please sign in again.');
      }
      if (res.statusCode >= 400) throw ApiException(res.statusCode, _errorText(data) ?? 'Request failed (${res.statusCode})');
      return data;
    } on ApiException {
      rethrow;
    } catch (_) {
      throw ApiException(0, 'Network error. Check your connection.');
    }
  }

  /// multipart POST with text fields and several files (compose / reply with attachments).
  Future<dynamic> multipartForm(String path, Map<String, String> fields, {List<String> files = const [], String fileField = 'attachments[]'}) async {
    final req = http.MultipartRequest('POST', _u(path));
    req.headers.addAll({'Accept': 'application/json', if (DeviceEnv.cached != null) 'X-Timezone': DeviceEnv.cached!, if (session.token != null) 'Authorization': 'Bearer ${session.token}'});
    req.fields.addAll(fields);
    for (final f in files) {
      if (File(f).existsSync()) req.files.add(await http.MultipartFile.fromPath(fileField, f));
    }
    try {
      final res = await http.Response.fromStream(await req.send().timeout(const Duration(seconds: 180)));
      final dynamic data = res.body.isEmpty ? null : _tryDecode(res.body);
      if (res.statusCode == 401) {
        session.signOut(remote: false);
        throw ApiException(401, 'Session expired. Please sign in again.');
      }
      if (res.statusCode >= 400) throw ApiException(res.statusCode, _errorText(data) ?? 'Request failed (${res.statusCode})');
      return data;
    } on ApiException {
      rethrow;
    } catch (_) {
      throw ApiException(0, 'Network error. Check your connection.');
    }
  }

  /// Authenticated file download (attachments).
  Future<List<int>> download(String path) async {
    try {
      final res = await http.get(_u(path), headers: {'Accept': '*/*', if (DeviceEnv.cached != null) 'X-Timezone': DeviceEnv.cached!, if (session.token != null) 'Authorization': 'Bearer ${session.token}'}).timeout(const Duration(seconds: 120));
      if (res.statusCode >= 400) throw ApiException(res.statusCode, 'Download failed (${res.statusCode})');
      return res.bodyBytes;
    } on ApiException {
      rethrow;
    } catch (_) {
      throw ApiException(0, 'Network error. Check your connection.');
    }
  }

  /// GET requests are safe to repeat, so one short retry hides temporary server hiccups (deadlock 500, 502/503/504, dropped connection).
  Future<dynamic> _send(String method, String path, {Map<String, String>? query, Object? body}) async {
    try {
      return await _sendOnce(method, path, query: query, body: body);
    } on ApiException catch (e) {
      final transient = e.status == 0 || e.status == 500 || e.status == 502 || e.status == 503 || e.status == 504;
      if (method != 'GET' || !transient) rethrow;
      await Future.delayed(const Duration(milliseconds: 700));
      return _sendOnce(method, path, query: query, body: body);
    }
  }

  Future<dynamic> _sendOnce(String method, String path, {Map<String, String>? query, Object? body}) async {
    final req = http.Request(method, _u(path, query));
    req.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (DeviceEnv.cached != null) 'X-Timezone': DeviceEnv.cached!,
      if (session.token != null) 'Authorization': 'Bearer ${session.token}',
    });
    if (body != null) req.body = jsonEncode(body);
    try {
      final streamed = await req.send().timeout(const Duration(seconds: 30));
      final res = await http.Response.fromStream(streamed);
      final dynamic data = res.body.isEmpty ? null : _tryDecode(res.body);
      if (res.statusCode == 401) {
        session.signOut(remote: false);
        throw ApiException(401, 'Session expired. Please sign in again.');
      }
      if (res.statusCode >= 400) {
        throw ApiException(res.statusCode, _errorText(data) ?? 'Request failed (${res.statusCode})');
      }
      return data;
    } on ApiException {
      rethrow;
    } catch (_) {
      throw ApiException(0, 'Network error. Check your connection.');
    }
  }

  static dynamic _tryDecode(String s) {
    try {
      return jsonDecode(s);
    } catch (_) {
      return null;
    }
  }

  static String? _errorText(dynamic d) {
    if (d is! Map) return null;
    final e = d['errors'];
    if (e is Map && e.isNotEmpty) {
      final v = e.values.first;
      return v is List && v.isNotEmpty ? v.first.toString() : v.toString();
    }
    return (d['message'] ?? d['error'])?.toString();
  }

  /// Laravel returns either a bare list or {data: [...], meta: {...}}.
  static List<Map<String, dynamic>> list(dynamic j) {
    dynamic l = j;
    if (j is Map) l = j['data'] ?? j['notifications'] ?? j['items'] ?? j['results'] ?? [];
    if (l is Map && l['data'] is List) l = l['data'];
    if (l is! List) return [];
    return l.whereType<Map>().map((m) => Map<String, dynamic>.from(m)).toList();
  }

  /// Single resource: {data: {...}} or {...}
  static Map<String, dynamic> obj(dynamic j) {
    if (j is Map) {
      final d = j['data'];
      return Map<String, dynamic>.from(d is Map ? d : j);
    }
    return {};
  }

  static int? total(dynamic j) {
    if (j is Map && j['meta'] is Map) {
      final t = (j['meta'] as Map)['total'];
      if (t is int) return t;
    }
    return null;
  }
}


/// Calls that need no login: server check, username availability, account recovery.
class PublicApi {
  static Map<String, String> get _h => {'Accept': 'application/json', 'Content-Type': 'application/json', if (DeviceEnv.cached != null) 'X-Timezone': DeviceEnv.cached!};

  static Future<({int status, dynamic body})> send(String method, String path, {Map<String, dynamic>? body, Map<String, String>? query}) async {
    var uri = Uri.parse('${AppConfig.apiBase}/$path');
    if (query != null && query.isNotEmpty) uri = uri.replace(queryParameters: query);
    try {
      final res = method == 'GET'
          ? await http.get(uri, headers: _h).timeout(const Duration(seconds: 20))
          : await http.post(uri, headers: _h, body: jsonEncode(body ?? {})).timeout(const Duration(seconds: 40));
      dynamic data;
      try {
        data = res.body.isEmpty ? null : jsonDecode(res.body);
      } catch (_) {
        data = null; // HTML error page etc.
      }
      return (status: res.statusCode, body: data);
    } catch (_) {
      return (status: 0, body: null);
    }
  }

  /// First human-readable error in a Laravel validation / message response.
  static String message(({int status, dynamic body}) r, {String fallback = 'Something went wrong. Please try again.'}) {
    if (r.status == 0) return 'Could not reach the server. Check your connection.';
    final b = r.body;
    if (b is Map) {
      final errs = b['errors'];
      if (errs is Map && errs.isNotEmpty) {
        final v = errs.values.first;
        return v is List && v.isNotEmpty ? '${v.first}' : '$v';
      }
      if (b['message'] != null) return '${b['message']}';
    }
    if (r.status == 404) return 'The server does not have the app API installed (404).';
    return fallback;
  }
}
