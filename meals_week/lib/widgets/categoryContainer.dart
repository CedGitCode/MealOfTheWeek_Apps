import 'package:flutter/material.dart';

class CategoryContainer extends StatefulWidget {
  CategoryContainer({Key? key}) : super(key: key);

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  double _containerSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_containerSize == 300.0)
          _containerSize = 50.0;
        else
          _containerSize = 300.0;
        setState(() {});
      },
      child: Container(
        height: _containerSize,
        color: Colors.red,
        child: const Text(
          "Je vais me déployer",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
