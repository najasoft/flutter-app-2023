import 'dart:io';
import 'package:contactsapp/contact_details.dart';
import 'package:contactsapp/data/base.dart';
import 'package:contactsapp/data/contact_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path/path.dart';

class ContactBox extends StatelessWidget {
  Contact contact;
  ContactDAO contactDAO;
  Function(BuildContext context)? delContact;

  ContactBox({super.key, required this.contact, required this.contactDAO});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (Context) => contactDAO.deleteContactById(contact.id!),
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
