import 'package:flutter/material.dart';

class AlertDialogAddCategory extends StatefulWidget {
  final Function addNewListElement;

  const AlertDialogAddCategory(this.addNewListElement);

  @override
  State<AlertDialogAddCategory> createState() => _AlertDialogAddCategoryState();
}

class _AlertDialogAddCategoryState extends State<AlertDialogAddCategory> {
  final _categoryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Ajout d'une nouvelle catégorie"),
      content: TextField(
        controller: _categoryTextController,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Annuler"),
        ),
        TextButton(
          onPressed: () {
            print(_categoryTextController.text);
            Navigator.of(context).pop();
            widget.addNewListElement();
          },
          child: const Text("Confirmer"),
        ),
      ],
    );
  }
}
