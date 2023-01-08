import 'package:flutter/material.dart';
import 'package:meals_week/widgets/meal_item.dart';
import '../models/mealWeek.dart';

class MealsWeekScreen extends StatefulWidget {
  const MealsWeekScreen({Key? key}) : super(key: key);

  @override
  State<MealsWeekScreen> createState() => _MealsWeekScreenState();
}

class _MealsWeekScreenState extends State<MealsWeekScreen> {
  List<MealWeek> mealWeek = [
    MealWeek('Lundi', {'Midi': 'Couscous', 'Soir': 'Lasagne'}),
    MealWeek('Mardi', {'Midi': 'Couscous', 'Soir': 'Lasagne'}),
    MealWeek('Mercredi', {'Midi': 'Couscous', 'Soir': 'Lasagne'}),
    MealWeek('Jeudi', {'Midi': 'Couscous', 'Soir': 'Lasagne'}),
    MealWeek('Vendredi', {'Midi': 'Couscous', 'Soir': 'Lasagne'}),
    MealWeek('Samedi', {'Midi': 'Couscous', 'Soir': 'Lasagne'}),
    MealWeek('Dimanche', {'Midi': 'Couscous', 'Soir': 'Lasagne'}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repas de la semaine.'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: mealWeek.length,
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
                      mealWeek[index].weekDay,
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
                     MealItem(title:mealWeek[index].meals['Midi'] as String),
                      const SizedBox(width: 15),
                      MealItem(title:mealWeek[index].meals['Soir'] as String),
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
