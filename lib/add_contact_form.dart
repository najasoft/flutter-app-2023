import 'dart:io';
import 'package:contactsapp/data/base.dart';
import 'package:contactsapp/data/contact_dao.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactForm extends StatefulWidget {
  ContactDAO contactDAO;
  AddContactForm({required this.contactDAO});

  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();

  int? id;
  String? nom;
  String? prenom;
  int? age;
  String? photo;
  String? email;

  String? _pickedImagePath;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImagePath = pickedFile.path;
      });
    }
  }

  void _saveContact() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      photo = _pickedImagePath!;

      widget.contactDAO.insertContact(ContactsCompanion.insert(
          age: age!, nom: nom!, email: email!, photo: photo!, prenom: prenom!));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez le prénom';
                  }
                  return null;
                },
                onSaved: (value) {
                  prenom = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez le  nom';
                  }
                  return null;
                },
                onSaved: (newValue) => nom = newValue!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez l' 'email';
                  }
                  return null;
                },
                onSaved: (newValue) => email = newValue!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || int.parse(value) < 17) {
                    return 'L' 'age doit être supérieur ou égal à 17 ans';
                  }
                  return null;
                },
                onSaved: (newValue) => age = int.parse(newValue!),
              ),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    color: Theme.of(context).primaryColorLight,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _pickedImagePath != null
                          ? FileImage(File(_pickedImagePath!))
                              as ImageProvider<Object>
                          : AssetImage('assets/images/placeholder.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          _formKey.currentState!.reset();
                          setState(() {
                            _pickedImagePath = null;
                          });
                        },
                        icon: Icon(Icons.restore_from_trash_rounded),
                        label: Text('Reset')),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveContact();
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
