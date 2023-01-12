import 'dart:convert';
import 'dart:ffi';

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

  Future<String> _initializeFile() async {
    final file = await _localFile;

    final String _initalizeData = "{\"Lundi\": {\"Midi\": \"Aucun\", \"Soir\":\"Aucun\"},"
        "\"Mardi\": {\"Midi\": \"Aucun\", \"Soir\":\"Aucun\"},"
        "\"Mercredi\": {\"Midi\": \"Aucun\", \"Soir\":\"Aucun\"},"
        "\"Jeudi\": {\"Midi\": \"Aucun\", \"Soir\":\"Aucun\"},"
        "\"Vendredi\": {\"Midi\": \"Aucun\", \"Soir\":\"Aucun\"},"
        "\"Samedi\": {\"Midi\": \"Aucun\", \"Soir\":\"Aucun\"},"
        "\"Dimanche\": {\"Midi\": \"Aucun\", \"Soir\":\"Aucun\"} }";

    file.writeAsString(_initalizeData);

    return _initalizeData;
  }

  Future<String> readJson() async {
    final file = await _localFile;

    try {
      final contents = await file.readAsString();
      return contents;
    }
    catch(e){
      final String contents = await _initializeFile();
      return contents;
    }

  }

  Future<void> writeJson(List<MealWeek> p_weeklyMeal) async {
    final file = await _localFile;

    Map<String, dynamic> jsonIntoMap = {};

    p_weeklyMeal.forEach((element) {
      jsonIntoMap.addAll(element.toJson());
    });

    final String jsonResult = jsonEncode(jsonIntoMap);

    file.writeAsString(jsonResult);
  }
}
