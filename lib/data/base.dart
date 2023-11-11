import 'dart:io';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'base.g.dart';

//La table contacts
@DataClassName('Contact')
class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nom => text()();
  TextColumn get prenom => text()();
  TextColumn get email => text()();
  IntColumn get age => integer()();
  TextColumn get photo => text()();
}

@DriftDatabase(tables: [Contacts])
class ContactsBase extends _$ContactsBase {
  ContactsBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'contacts_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
