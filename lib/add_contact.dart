import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  final ctr;
  VoidCallback onAdd;
  VoidCallback onCancel;

  AddContact(
      {super.key,
      required this.ctr,
      required this.onAdd,
      required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(children: [
          TextField(controller: ctr),
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
