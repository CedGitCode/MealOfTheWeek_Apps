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
    late String _initalizeData;

    if (fileName == 'mealWeekJson.json') {

     _initalizeData = "{\"Lundi\": {\"Midi\": \"?\", \"Soir\":\"?\"},"
        "\"Mardi\": {\"Midi\": \"?\", \"Soir\":\"?\"},"
        "\"Mercredi\": {\"Midi\": \"?\", \"Soir\":\"?\"},"
        "\"Jeudi\": {\"Midi\": \"?\", \"Soir\":\"?\"},"
        "\"Vendredi\": {\"Midi\": \"?\", \"Soir\":\"?\"},"
        "\"Samedi\": {\"Midi\": \"?\", \"Soir\":\"?\"},"
        "\"Dimanche\": {\"Midi\": \"?\", \"Soir\":\"?\"} }";
    }
    else {
      _initalizeData = '{}';
    }

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

  Future<void> writeJson(Map<String, dynamic> stringElements) async {
    final file = await _localFile;

    final String jsonResult = jsonEncode(stringElements);

    file.writeAsString(jsonResult);
  }
}
