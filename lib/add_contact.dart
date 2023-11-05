import 'package:contactsapp/model/contact.dart';
import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  Contact contact;
  VoidCallback onAdd;
  VoidCallback onCancel;

  AddContact(
      {super.key,
      required this.contact,
      required this.onAdd,
      required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(children: [
          TextField(
            onChanged: (value) => contact.nom,
          ),
          Row(
            children: [
              MaterialButton(onPressed: onAdd, child: Text("Add")),
              MaterialButton(onPressed: onCancel, child: Text("Cancel"))
            ],
          )
        ]),
      ),
    );
  }
}
