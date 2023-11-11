import 'package:contactsapp/data/base.dart';
import 'package:drift/drift.dart';

@DriftAccessor(tables: [Contacts])
class ContactDAO extends DatabaseAccessor<ContactsBase> {
  ContactDAO(ContactsBase attachedDatabase) : super(attachedDatabase);

  Future<void> insertContact(ContactsCompanion contact) =>
      into(attachedDatabase.contacts).insert(contact);

  Future<List<Contact>> getAllContacts() =>
      select(attachedDatabase.contacts).get();

  Stream<List<Contact>> getContactsStream() =>
      select(attachedDatabase.contacts).watch();

  // Method to update a contact
  Future<bool> updateContact(ContactsCompanion contact) =>
      update(attachedDatabase.contacts).replace(contact);

  // Method to delete a contact by ID
  Future<int> deleteContactById(int id) =>
      (delete(attachedDatabase.contacts)..where((c) => c.id.equals(id))).go();

  // Method to get a contact by ID
  Future<Contact> getContactById(int id) =>
      (select(attachedDatabase.contacts)..where((c) => c.id.equals(id)))
          .getSingle();
}
