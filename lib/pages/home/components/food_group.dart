import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';

class FoodGroup extends StatelessWidget {
  const FoodGroup(
      {Key? key,
      required this.foodName,
      required this.foodImg,
      required this.onPress})
      : super(key: key);
  final String foodName;
  final String foodImg;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: SizeConfig.screenWidth! * 0.22,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              width: 47,
              height: 47,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                foodImg,
              ),
            ),
            Text(foodName)
          ],
        ),
      ),
    );
  }
}
