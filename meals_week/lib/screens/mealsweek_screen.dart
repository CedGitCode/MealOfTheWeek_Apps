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
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex != 1) {
      _selectedIndex = 1;
    }
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
                      color: const Color.fromRGBO(132, 169, 140, 1),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Recettes'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Courses'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(132, 169, 140, 1),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.of(context).pushNamed('/recipeideaScreen');
          }
          else if (index == 2) {
            Navigator.of(context).pushNamed('/marketListScreen');
          }
        },
      ),
    );
  }
}
