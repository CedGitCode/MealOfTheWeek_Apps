import 'package:flutter/material.dart';
import 'package:meals_week/models/FileManager.dart';
import 'package:meals_week/models/recipe.dart';
import 'package:provider/provider.dart';

import '../providers/recipelist.dart';
import './star_rating.dart';

class AddRecipeIdea extends StatefulWidget {
  const AddRecipeIdea({Key? key}) : super(key: key);

  @override
  State<AddRecipeIdea> createState() => _AddRecipeIdeaState();
}

class _AddRecipeIdeaState extends State<AddRecipeIdea> {
  final TextEditingController _titleRecipe = TextEditingController();

  @override
  void dispose() {
    _titleRecipe.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipeList = Provider.of<RecipeList>(context, listen: false);

    int _mealGrade = 0;

    void modifyMealGrade(int index) {
      _mealGrade = index;
    }

    Future<void> addingNewRecipeInList() async {
      if (recipeList.alreadyContains(_titleRecipe.text) == true) return;

      recipeList.addingRecipeIdea(
        Recipe(p_title: _titleRecipe.text, p_grade: _mealGrade),
      );

      FileManager recipeIdeaFile = FileManager(fileName: 'recipeIdea.json');
      recipeIdeaFile.writeJson(recipeList.toJson());

      Navigator.of(context).pop();
    }

    return AlertDialog(
      title: const Text('Nouvelle idée recette'),
      content: Container(
        height: 150,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) {},
                  controller: _titleRecipe,
                  decoration: const InputDecoration(
                    labelText: "Nom de votre Recette",
                  ),
                ),
                const SizedBox(height: 15,),
                SizedBox(height: 50, width: double.maxFinite, child: StarRating(modifyMealGrade)),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Annuler"),
        ),
        TextButton(
          onPressed: () => addingNewRecipeInList(),
          child: const Text("Ajouter"),
        ),
      ],
    );
  }
}
