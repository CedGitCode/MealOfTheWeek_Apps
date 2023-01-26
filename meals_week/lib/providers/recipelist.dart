import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe.dart';

class RecipeList with ChangeNotifier {
  List<Recipe> _recipeList = [
    Recipe(p_title: "Rissoto Courgettes", p_grade: 3),
    Recipe(p_title: "Pâtes carbonara", p_grade: 5),
    Recipe(p_title: "Couscous tomates", p_grade: 1),
    Recipe(p_title: "Rissoto Courgettes", p_grade: 3),
    Recipe(p_title: "Pâtes carbonara", p_grade: 5),
    Recipe(p_title: "Couscous tomates", p_grade: 1),
    Recipe(p_title: "Rissoto Courgettes", p_grade: 3),
    Recipe(p_title: "Pâtes carbonara", p_grade: 5),
    Recipe(p_title: "Couscous tomates", p_grade: 1),
  ];

  List<Recipe> getRecipeList() {
    return [..._recipeList];
  }
}