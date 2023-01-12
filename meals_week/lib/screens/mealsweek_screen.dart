import 'package:flutter/material.dart';
import 'package:meals_week/widgets/meal_item.dart';
import '../models/mealWeek.dart';

class MealsWeekScreen extends StatefulWidget {
  List<MealWeek> weeklyMeal;

  MealsWeekScreen({Key? key, required this.weeklyMeal}) : super(key: key);

  @override
  State<MealsWeekScreen> createState() => _MealsWeekScreenState();
}

class _MealsWeekScreenState extends State<MealsWeekScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repas de la semaine.'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: widget.weeklyMeal.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                    ),
                    child: Text(
                      widget.weeklyMeal[index].weekDay,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MealItem(
                        weeklyMeal: widget.weeklyMeal,
                        actualDay: index,
                        whichPeriodOfDay: 'Midi',
                      ),
                      const SizedBox(width: 15),
                      MealItem(
                        weeklyMeal: widget.weeklyMeal,
                        actualDay: index,
                        whichPeriodOfDay: 'Soir',
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
