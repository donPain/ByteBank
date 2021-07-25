import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE IF NOT EXISTS contacts('
          'id INTEGER primary key, '
          'name TEXT , '
          'account_number INTEGER) ');
    }, version: 1);
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then(
    (db) {
      final Map<String, dynamic> contactMap = Map();
      contactMap['id'] = contact.id;
      contactMap['name'] = contact.name;
      contactMap['account_number'] = contact.accountNumber;
      return db.insert('contact', contactMap);
    },
  );
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = List.empty();
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['Id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
