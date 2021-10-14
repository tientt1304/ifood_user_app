import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';

class TitleContent extends StatelessWidget {
  const TitleContent({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight!*0.06),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 28, fontFamily: 'FSBold', fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizeConfig.screenHeight!*0.03,),
          Text(
            content,
            style: TextStyle(fontSize: 14, color: secondaryColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
