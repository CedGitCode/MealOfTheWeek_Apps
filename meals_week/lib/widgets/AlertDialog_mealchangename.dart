import "package:flutter/material.dart";

class MealChangeName extends StatefulWidget {
  final Function p_changeMeal;

  MealChangeName(this.p_changeMeal);

  @override
  State<MealChangeName> createState() => _MealChangeNameState();
}

class _MealChangeNameState extends State<MealChangeName> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouveau Plat'),
      content: TextField(
        controller: _controller,
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Annuler',
            style: TextStyle(
              color: Color.fromRGBO(47, 62, 70, 1),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            'Confirmer',
            style: TextStyle(
              color: Color.fromRGBO(47, 62, 70, 1),
            ),
          ),
          onPressed: () {
            if (_controller.text.isEmpty) {
              return;
            }
            widget.p_changeMeal(_controller.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
