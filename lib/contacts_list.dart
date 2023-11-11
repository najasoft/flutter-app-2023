import 'package:contactsapp/add_contact_form.dart';
import 'package:contactsapp/contact_box.dart';
import 'package:contactsapp/data/base.dart';
import 'package:contactsapp/data/contact_dao.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final ContactDAO contactDAO;
  ContactsList({super.key, required this.contactDAO});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Mes contacts")),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddContactForm(
                        contactDAO: contactDAO,
                      ))),
          child: Icon(Icons.person),
        ),
        body: StreamBuilder<List<Contact>>(
            stream: contactDAO.getContactsStream(),
            builder: (context, snapshot) {
              if ((snapshot.hasData == false) ||
                  snapshot.data == null ||
                  snapshot.data!.isEmpty) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text("Aucun contact"),
                  );
                }
              }
              final contacts = snapshot.data;
              return ListView.builder(
                  itemCount: contacts!.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ContactBox(
                      contact: contact,
                      contactDAO: contactDAO,
                    );
                  });
            }));
  }
}
