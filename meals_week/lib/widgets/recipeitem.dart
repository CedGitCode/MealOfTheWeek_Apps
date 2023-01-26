import 'package:flutter/material.dart';
import 'package:meals_week/models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final String title;
  final int grade;
  final List<String>? hints;

  RecipeItem({required this.title, required this.grade, this.hints});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(title, style: TextStyle(color: Colors.black),),
        trailing: Text("Ah oui"),
      ),
    );
  }
}
