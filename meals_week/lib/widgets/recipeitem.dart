import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/FileManager.dart';
import '../providers/recipelist.dart';

class RecipeItem extends StatelessWidget {
  final int id;
  final String title;
  final int grade;
  final List<String>? hints;

  RecipeItem({required this.id, required this.title, required this.grade, this.hints});

  bool get ElementColor {
    return true;
  }

  Future<void> removeRecipeFromList(BuildContext context) async {
    Provider.of<RecipeList>(context, listen: false).removeRecipeIdea(title);

    FileManager recipeIdeaFile = FileManager(fileName: 'recipeIdea.json');
    recipeIdeaFile.writeJson(
        Provider.of<RecipeList>(context, listen: false).toJson());
  }

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (_) => removeRecipeFromList(context),
      key: ValueKey(title),
      direction: DismissDirection.endToStart,
      child: Card(
        child: ListTile(
          leading: Container(
            width: 180.0,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                title,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          trailing: Container(
            width: 150,
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                    grade > i
                      ? const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      : const Icon(Icons.star, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
