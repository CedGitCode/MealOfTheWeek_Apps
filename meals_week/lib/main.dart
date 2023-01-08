import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

import 'screens/mealsweek_screen.dart';
import 'models/mealWeek.dart';


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
  bool _fileExits = false;
  late File _filePath;

  List<MealWeek> meals = [];

  Map<String, dynamic> _jsonIntoMap = {};
  late String _jsonString;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$FILENAME');
  }

  void _readJson() async {

    _filePath = await _localFile;
    _fileExits = await _filePath.exists();

    if (_fileExits) {
      _jsonString = await _filePath.readAsString();

      _jsonIntoMap = jsonDecode(_jsonString);
    }
  }

  void _writeJson(MealWeek p_day) async {

    _jsonIntoMap.addAll(p_day.toJson());

    _jsonString = jsonEncode(_jsonIntoMap);

    _filePath.writeAsString(_jsonString);
  }

  @override
  void initState() {
    super.initState();

    //_readJson();
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
      home: const MealsWeekScreen(),
    );
  }
}

/*
{
  "Lundi": {
    "Midi" : "Cordon bleu",
    "Soir" : "Legumes",
  },
  "Mardi": {
    "Midi" : "Salade",
    "Soir" : "Couscous",
  }
}
*/
