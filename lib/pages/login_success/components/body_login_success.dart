import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';

class BodyLoginSuccess extends StatelessWidget {
  const BodyLoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/success.svg',
          width: double.infinity,
        ),
        Text('Congrats!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'FSSemiBold',
              fontSize: 30,
              color: mainColor,
            )),
        Text('Login successful',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'FSSemiBold',
              fontSize: 23,
              color: kTitleColor,
            )),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.1,
        ),
        MainButton(title: 'Back to Home', onPress: () {})
      ],
    );
  }
}
