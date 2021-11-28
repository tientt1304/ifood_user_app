import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';
import '../../../constants.dart';

class FoodFilterCard extends StatefulWidget {
  FoodFilterCard(
      {Key? key,
      required this.filterName,
      required this.filterImg,
      this.onPress})
      : super(key: key);
  final Function()? onPress;
  final String? filterName;
  final String? filterImg;

  @override
  State<FoodFilterCard> createState() => _FoodFilterCardState();
}

class _FoodFilterCardState extends State<FoodFilterCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    int count = 0;
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
          (count % 2 == 1) ? isSelected = true : isSelected = false;
          print('$count $isSelected');
          printText(isSelected);
        });
      },
      child: Container(
        padding: EdgeInsets.all(4.0),
        width: SizeConfig.screenWidth! * 0.22,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(50)),
              child: Image.asset(
                widget.filterImg!,
              ),
            ),
            printText(isSelected)
          ],
        ),
      ),
    );
  }

  Widget printText(bool isSelected) {
    return Text(
      widget.filterName!,
      style: isSelected == true
          ? TextStyle(color: primaryColor, fontWeight: FontWeight.bold)
          : TextStyle(color: secondaryColor),
    );
  }
}
