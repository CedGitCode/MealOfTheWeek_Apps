import 'package:flutter/material.dart';
import 'package:meals_week/models/FileManager.dart';

import '../models/mealWeek.dart';
import "../widgets/AlertDialog_mealchangename.dart";

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
  final FileManager _fileManager = FileManager(fileName: 'mealWeekJson.json');

  void changeMeal(String p_newRecipe) {
    setState(() {
      widget.weeklyMeal[widget.actualDay].meals[widget.whichPeriodOfDay] =
          p_newRecipe;
      _fileManager.writeJson(widget.weeklyMeal);
    });
  }

  void resetMealName() {
    String nameMealClicked =
        widget.weeklyMeal[widget.actualDay].meals[widget.whichPeriodOfDay];

    if (nameMealClicked.startsWith('?', 0) && nameMealClicked.length == 1)
      return;

    setState(() {
      widget.weeklyMeal[widget.actualDay]
          .setDefaultMeal(widget.whichPeriodOfDay);
      _fileManager.writeJson(widget.weeklyMeal);
    });
  }

  Widget get textToDisplayOnMealItem {
    String mealItemName =
        widget.weeklyMeal[widget.actualDay].meals[widget.whichPeriodOfDay];

    if (mealItemName.startsWith('?', 0) && mealItemName.length == 1) {
      return const Icon(
        Icons.no_meals,
        color: Colors.white,
        size: 50.0,
      );
    } else {
      return Text(
          widget.weeklyMeal[widget.actualDay].meals[widget.whichPeriodOfDay]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onLongPress: () {
          resetMealName();
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
          child: textToDisplayOnMealItem,
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => MealChangeName(changeMeal),
          );
        },
      ),
    );
  }
}
