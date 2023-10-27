import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactBox extends StatelessWidget {
  String nomContact;
  bool selContact;
  Function(bool?)? onChanged;
  Function(BuildContext context)? delContact;

  ContactBox(
      {super.key,
      required this.nomContact,
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
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(45)),
          child: Row(
            children: [
              Checkbox(value: selContact, onChanged: onChanged),
              Text(nomContact),
            ],
          ),
        ),
      ),
    );
  }
}
