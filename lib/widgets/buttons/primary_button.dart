import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';

import '../../constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title, required this.onPress})
      : super(key: key);
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: getProportionateScreenWidth(257),
        height: getProportionateScreenHeight(50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [primaryColor, mainColor]),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ElevatedButton(
          onPressed: onPress,
          child: Text(
            title,
            style: TextStyle(
              color: mainColor,
              fontFamily: 'FSSemiBold',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(width: 1, color: mainColor)
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ),
    );
  }
}
