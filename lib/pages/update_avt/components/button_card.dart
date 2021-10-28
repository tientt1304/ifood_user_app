import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';

class ButtonCard extends StatelessWidget {
  ButtonCard(
      {Key? key, required this.img, required this.text, required this.onPress})
      : super(key: key);
  final String img, text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          height: SizeConfig.screenHeight! * 0.2,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFE3E3E3).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                )
              ]),
          width: double.infinity,
          child: Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(img),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.03,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'FSBold',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
