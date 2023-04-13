import "package:flutter/material.dart";

import '../widgets/categoryContainer.dart';
import '../widgets/AlertDialog_AddCategory.dart';

class MarketListScreen extends StatefulWidget {
  MarketListScreen({Key? key}) : super(key: key);

  @override
  State<MarketListScreen> createState() => _MarketListScreenState();
}

class _MarketListScreenState extends State<MarketListScreen> {
  final List<int> myList = [
    1,
    2,
    3,
    4,
  ];

  void addNewListElement() {
    myList.add(5);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma liste de courses"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialogAddCategory(addNewListElement),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, id) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: CategoryContainer(),
            );
          },
        ),
      ),
    );
  }
}
