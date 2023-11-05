import 'dart:io';
import 'package:contactsapp/model/contact.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  final Contact contact;

  ContactDetails({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.file(
                File(contact.photo),
                width: 160,
                height: 160,
              ),
              SizedBox(height: 16),
              Text(
                '${contact.nom} ${contact.prenom}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Age: ${contact.age}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Email: ${contact.email}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Contact ID: ${contact.id}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
