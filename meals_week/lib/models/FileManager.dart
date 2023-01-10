import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import './mealWeek.dart';

class FileManager {

  // Constructeur.
  final String fileName;

  FileManager({this.fileName = 'mealWeekJson.json'});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<String> readJson() async {

    try {
      print('I\'m reading');

      final file = await _localFile;

      final contents = await file.readAsString();

      return contents;
    }
    catch(e){
      return "{}";
    }

  }

  Future<void> writeJson(MealWeek p_day) async {
    final file = await _localFile;

    Map<String, dynamic> jsonIntoMap;

    final String contents = await readJson();

    print('Im here: $contents');
    jsonIntoMap = jsonDecode(contents);

    print(p_day.toJson());

    jsonIntoMap.addAll(p_day.toJson());

    print(jsonIntoMap);

    final String jsonResult = jsonEncode(jsonIntoMap);

    file.writeAsString(jsonResult);
  }

}