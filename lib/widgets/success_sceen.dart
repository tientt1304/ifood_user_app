import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/Success.png',
          width: SizeConfig.screenWidth!,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.01,
        ),
        Text('Congrats!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'FSSemiBold',
              fontSize: 30,
              color: mainColor,
            )),
        Text(text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'FSSemiBold',
              fontSize: 23,
              color: kTitleColor,
            )),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.1,
        ),
      ],
    );
  }
}
