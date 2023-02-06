import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/FileManager.dart';
import '../providers/recipelist.dart';

class RecipeItem extends StatelessWidget {
  final String title;
  final int grade;
  final List<String>? hints;

  RecipeItem({required this.title, required this.grade, this.hints});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (_) {
        Provider.of<RecipeList>(context, listen: false).removeRecipeIdea(title);

        FileManager recipeIdeaFile = FileManager(fileName: 'recipeIdea.json');
        recipeIdeaFile.writeJson(Provider.of<RecipeList>(context, listen: false).toJson());
      },
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      child: Card(
        child: ListTile(
          leading: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          trailing: Text("Ah oui"),
        ),
      ),
    );
  }
}
