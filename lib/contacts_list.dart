import 'package:contactsapp/add_contact.dart';
import 'package:contactsapp/contact_box.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  // Liste des contacts
  List liste = [
    ["1 Contact", false],
    ["2 Contact", true],
    ["3 Contact", false],
    ["4 Contact", false],
    ["5 Contact", false]
  ];

  void change(bool? value, int index) {
    setState(() {
      liste[index][1] = value;
    });
  }

// déclaration du contrôleur
  final controller = TextEditingController();
  void saveContact() {
    setState(() {
      liste.add([controller.text, false]);
      controller.clear(); // Efface le contenu du contrôleur
      Navigator.of(context).pop(); // ferme la boite de dialogue
    });
  }

  //Suppression d'un contact
  void delContact(index) {
    setState(() {
      liste.removeAt(index);
    });
  }

  void addContact() {
    showDialog(
        context: context,
        builder: (context) {
          return AddContact(
              ctr: controller,
              onAdd: saveContact,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Mes contacts")),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addContact(),
          child: Icon(Icons.person),
        ),
        body: ListView.builder(
            itemCount: liste.length,
            itemBuilder: (context, index) {
              return ContactBox(
                nomContact: liste[index][0],
                selContact: liste[index][1],
                onChanged: (value) => change(value, index),
                delContact: (context) => delContact(index),
              );
            }));
  }
}
