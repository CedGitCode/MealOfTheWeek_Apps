import 'package:flutter/material.dart';
import 'package:meals_week/models/FileManager.dart';
import '../models/mealWeek.dart';

class MealItem extends StatefulWidget {

  // List of weeklyMeal
  List<MealWeek> weeklyMeal;

  // index of weeklyMeal
  final int actualDay;

  // Lunch or Diner
  final String whichPeriodOfDay;

  MealItem(
      {required this.weeklyMeal,
      required this.actualDay,
      required this.whichPeriodOfDay});

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  late TextEditingController _controller;
  final FileManager _fileManager = FileManager(fileName: 'mealWeekJson.json');

  void changeMeal(String p_newRecipe) {
    setState(() {
      widget.weeklyMeal[widget.actualDay].meals[widget.whichPeriodOfDay] =
          p_newRecipe;
      _fileManager.writeJson(widget.weeklyMeal);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onLongPress: () {

          String nameMealClicked = widget.weeklyMeal[widget.actualDay].meals[widget.whichPeriodOfDay];

          if (nameMealClicked.startsWith('?', 0) && nameMealClicked.length == 1) return;

          setState(() {
            widget.weeklyMeal[widget.actualDay].setDefaultMeal(widget.whichPeriodOfDay);
            _fileManager.writeJson(widget.weeklyMeal);
          });
        },
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
          child: Text(widget
              .weeklyMeal[widget.actualDay].meals[widget.whichPeriodOfDay]),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (ctx) {
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
