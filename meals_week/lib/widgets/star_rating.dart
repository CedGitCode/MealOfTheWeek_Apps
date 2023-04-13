import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {

  Function modifyMealGrade;

  StarRating(this.modifyMealGrade);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  List<Color> iconColorList = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];

  void changeStarsColor(int index) {
    if (iconColorList[index] == Colors.yellow) {
      for (int i = index + 1; i < 5; i++) {
        if (iconColorList[i] == Colors.yellow) {
          iconColorList[i] = Colors.grey;
        }
      }
    } else {
      for (int i = index; i >= 0; i--) iconColorList[i] = Colors.yellow;
    }

    widget.modifyMealGrade(amountofStars());
    setState(() {});
  }

  int amountofStars() {
    int counter = 0;

    iconColorList.forEach((element) {
      if (element == Colors.yellow) {
        counter++;
      }
    });
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () => changeStarsColor(index),
          child: Icon(
            Icons.star,
            size: 50,
            color: iconColorList[index],
          ),
        );
      },
    );
  }
}
