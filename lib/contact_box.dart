import 'dart:io';
import 'package:contactsapp/contact_details.dart';
import 'package:contactsapp/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactBox extends StatelessWidget {
  Contact contact;
  bool selContact;
  Function(bool?)? onChanged;
  Function(BuildContext context)? delContact;

  ContactBox(
      {super.key,
      required this.contact,
      required this.selContact,
      required this.onChanged,
      required this.delContact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delContact,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(45),
            )
          ],
        ),
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContactDetails(contact: contact))),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(45)),
            child: Row(
              children: [
                Checkbox(value: selContact, onChanged: onChanged),
                Center(
                  child: Image.file(
                    width: 50,
                    height: 50,
                    File(contact.photo),
                  ),
                ),
                SizedBox(width: 10),
                Text(contact.nom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
