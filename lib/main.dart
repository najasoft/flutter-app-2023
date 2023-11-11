import 'package:contactsapp/contacts_list.dart';
import 'package:contactsapp/data/base.dart';
import 'package:contactsapp/data/contact_dao.dart';
import 'package:flutter/material.dart';

void main() {
  final database = ContactsBase();
  final ContactDAO contactDAO = ContactDAO(database);

  runApp(MainApp(contactDAO: contactDAO));
}

class MainApp extends StatelessWidget {
  final ContactDAO contactDAO;
  MainApp({super.key, required this.contactDAO});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ContactsList(contactDAO: contactDAO),
      ),
    );
  }
}
