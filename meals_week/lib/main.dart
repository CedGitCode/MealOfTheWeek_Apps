import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'models/mealWeek.dart';
import 'models/FileManager.dart';

import 'screens/mealsweek_screen.dart';
import 'screens/recipeidea_screen.dart';
import 'screens/marketlist_screen.dart';

import 'providers/recipelist.dart';

import 'models/recipe.dart';

const String FILENAME = 'myJsonFile.json';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => RecipeList(),
      ),
    ], child: const MyApp()),
  );
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

    _fileManager.readJson().then((value) {
      Map<String, dynamic> transformJsonIntoMap = jsonDecode(value);

      transformJsonIntoMap.forEach((key, value) {
        _dataOfWeeklyMeal.add(MealWeek(key, value));
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RecipeList>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(132, 169, 140, 1),
        )
      ),
      home: _dataOfWeeklyMeal.isEmpty
          ? const Scaffold(
              body: Center(
                child: Text('Chargement'),
              ),
            )
          : MealsWeekScreen(weeklyMeal: _dataOfWeeklyMeal),
      initialRoute: '/',
      routes: {
        '/recipeideaScreen': (context) => const RecipeIdeaScreen(),
        '/marketListScreen': (context) => MarketListScreen(),
      },
    );
  }
}
