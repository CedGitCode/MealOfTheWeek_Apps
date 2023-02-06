import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../models/recipe.dart';
import '../models/FileManager.dart';

class RecipeList with ChangeNotifier {
  List<Recipe> _recipeList = [];

  void addingRecipeIdea(Recipe p_newRecipe) {
    _recipeList.add(p_newRecipe);
    notifyListeners();
  }

  void removeRecipeIdea(String p_recipeTitle) {
    _recipeList.removeWhere((element) => element.title == p_recipeTitle);

    notifyListeners();
  }
  void InitializeRecipeList() {

    final _FileManagerRecipeIdea = FileManager(fileName: 'recipeIdea.json');

    _FileManagerRecipeIdea.readJson().then((value) {
      Map<String, dynamic> transformJsonIntoMap = jsonDecode(value);

      transformJsonIntoMap.forEach((key, value) {
        _recipeList.add(Recipe(p_title: key, p_grade: value));
      });

      notifyListeners();
    });
  }

  void modifyRecipeList(RecipeList p_RecipeObject) {
    p_RecipeObject.getRecipeList().forEach((element) {
      _recipeList.add(element);
    });
    //notifyListeners();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> stringOfRecipeList = {};

    _recipeList.forEach((element) {
      stringOfRecipeList.putIfAbsent(element.title, () => element.grade);
    });

    return stringOfRecipeList;
  }

  List<Recipe> getRecipeList() {
    return [..._recipeList];
  }
}