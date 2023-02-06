import 'package:flutter/material.dart';
import 'package:meals_week/models/FileManager.dart';
import 'package:meals_week/models/recipe.dart';
import 'package:provider/provider.dart';

import '../providers/recipelist.dart';

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

    return AlertDialog(
      title: const Text('Nouvelle idée recette'),
      content: Container(
        height: 150,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                onFieldSubmitted: (_) {},
                controller: _titleRecipe,
                decoration: const InputDecoration(
                  labelText: "Nom de votre Recette",
                ),
              ),
            ],
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
          onPressed: () {
            recipeList.addingRecipeIdea(
              Recipe(p_title: _titleRecipe.text, p_grade: 2),
            );

            FileManager recipeIdeaFile = FileManager(fileName: 'recipeIdea.json');
            recipeIdeaFile.writeJson(recipeList.toJson());
            Navigator.of(context).pop();
          },
          child: const Text("Ajouter"),
        ),
      ],
    );
  }
}
