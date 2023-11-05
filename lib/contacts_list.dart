import 'package:contactsapp/add_contact_form.dart';
import 'package:contactsapp/contact_box.dart';
import 'package:contactsapp/model/contact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  // Liste des contacts
  List liste = [];

  void change(bool? value, int index) {
    setState(() {
      liste[index][1] = value;
    });
  }

  void saveContact(Contact contact) {
    setState(() {
      liste.add([contact, false]);
    });
  }

  //Suppression d'un contact
  void delContact(index) {
    setState(() {
      liste.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Mes contacts")),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddContactForm(onSubmit: saveContact))),
          child: Icon(Icons.person),
        ),
        body: ListView.builder(
            itemCount: liste.length,
            itemBuilder: (context, index) {
              return ContactBox(
                contact: liste[index][0],
                selContact: liste[index][1],
                onChanged: (value) => change(value, index),
                delContact: (context) => delContact(index),
              );
            }));
  }
}
