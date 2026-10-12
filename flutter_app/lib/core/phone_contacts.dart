import 'package:flutter_contacts/flutter_contacts.dart';
import 'app_permissions.dart';

/// Reads the phone numbers in the phone's contact list (with the person's permission) and turns each into the same "key" the
/// server uses to compare numbers: digits only, last 10 digits. Names are never read or sent – only these keys.
class PhoneContacts {
  /// null = the person refused the permission.
  static Future<List<String>?> keys() async {
    if (!await AppPermissions.contacts()) return null; // our explanation first, then the phone's dialog
    if (!await FlutterContacts.requestPermission(readonly: true)) return null;
    final contacts = await FlutterContacts.getContacts(withProperties: true, withPhoto: false);
    final out = <String>{};
    for (final c in contacts) {
      for (final p in c.phones) {
        final d = p.number.replaceAll(RegExp(r'\D'), '');
        if (d.length < 8) continue; // too short to identify anybody
        out.add(d.length > 10 ? d.substring(d.length - 10) : d);
      }
    }
    return out.take(3000).toList();
  }
}
