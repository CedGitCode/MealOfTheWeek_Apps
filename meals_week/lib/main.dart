import 'package:flutter/material.dart';
import 'dart:convert';

import 'screens/mealsweek_screen.dart';
import 'models/mealWeek.dart';
import 'models/FileManager.dart';

const String FILENAME = 'myJsonFile.json';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Will take the meal of json File.
  List<MealWeek> _dataOfWeeklyMeal = [];

  @override
  void initState() {
    super.initState();

    // Me permet de lire/écrire dans le fichier
    final FileManager _fileManager = FileManager(fileName: 'mealWeekJson.json');

    _fileManager.readJson().then( (value) {

      Map<String, dynamic> transformJsonIntoMap = jsonDecode(value);
      print(transformJsonIntoMap);

      transformJsonIntoMap.forEach((key, value) {
        _dataOfWeeklyMeal.add( MealWeek(key, value) );
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )
      ),
      home: _dataOfWeeklyMeal.isEmpty ? const Scaffold(body: Center(child:Text('Coucou'),),) : MealsWeekScreen(weeklyMeal: _dataOfWeeklyMeal),
    );
  }
}