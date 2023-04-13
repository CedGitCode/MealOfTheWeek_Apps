import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/recipeitem.dart';
import '../models/recipe.dart';
import '../providers/recipelist.dart';
import '../widgets/AlertDialog_addrecipeIdea.dart';

class RecipeIdeaScreen extends StatefulWidget {
  const RecipeIdeaScreen({Key? key}) : super(key: key);

  @override
  State<RecipeIdeaScreen> createState() => _RecipeIdeaScreenState();
}

class _RecipeIdeaScreenState extends State<RecipeIdeaScreen> {

  @override
  Widget build(BuildContext context) {
  final RecipeList _recipeList = Provider.of<RecipeList>(context);
  final List<Recipe> recipes = _recipeList.getRecipeList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Idées'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 50,
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipes.length,
                  itemBuilder: (_, index) {
                    return RecipeItem(id: index, title:recipes[index].title, grade: recipes[index].grade);
                  }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => const AddRecipeIdea(),
          );
        },
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
