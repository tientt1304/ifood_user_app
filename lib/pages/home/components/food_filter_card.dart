import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/category/category2_screen.dart';

import '../../../SizeConfig.dart';
import '../../../constants.dart';

class FoodFilterCard extends StatefulWidget {
  FoodFilterCard({
    Key? key,
    required this.filterName,
    required this.filterImg,
  }) : super(key: key);
  final String? filterName;
  final String? filterImg;

  @override
  State<FoodFilterCard> createState() => _FoodFilterCardState();
}

class _FoodFilterCardState extends State<FoodFilterCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Category2Screen(category: widget.filterName!.toLowerCase())));
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
            Text(widget.filterName!)
          ],
        ),
      ),
    );
  }
}
