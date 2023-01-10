import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

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

  final storage = FileManager(fileName: 'mealWeekJson.json');

  @override
  void initState() {
    super.initState();

    storage.readJson();

    //_writeJson( MealWeek('Lundi', {'Midi': 'Couscous', 'Soir': 'Lasagne'}) );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ),
      home: MealsWeekScreen(storage:storage),
    );
  }
}