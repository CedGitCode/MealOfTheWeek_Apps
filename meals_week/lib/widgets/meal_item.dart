import 'package:flutter/material.dart';

class MealItem extends StatefulWidget {
  String title;

  MealItem({this.title = 'Aucun'});

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {

  late TextEditingController _controller;

  void changeMeal(String p_title)
  {
    setState(() {
      widget.title = p_title;
    });
  }

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.blue,
                Colors.black,
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Text(widget.title),
        ),
        onTap: () {
          showDialog(context: context, builder: (ctx) {
            return AlertDialog(
              title: const Text('Test'),
              content: TextField(
                controller: _controller,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Confirmer.'),
                  onPressed: () {
                    changeMeal(_controller.text);
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            );
          });
        },
      ),
    );
  }
}
