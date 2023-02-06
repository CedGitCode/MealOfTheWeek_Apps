import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/recipeitem.dart';
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
    final recipeList = Provider.of<RecipeList>(context).getRecipeList();
    print("Ma liste");
    print(recipeList);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Idées Recettes'),
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
                  itemCount: recipeList.length,
                  itemBuilder: (_, index) {
                    return RecipeItem(title:recipeList[index].title, grade: recipeList[index].grade);
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
