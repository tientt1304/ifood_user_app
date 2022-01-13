import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/walkthrough/components/body_walkthrough.dart';

class SplashScreen2 extends StatelessWidget {
  static String routeName = '/SplashScreen2';
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    delay(context);
    return Scaffold(
      body: Container(
        child: Center(child: SvgPicture.asset('assets/icons/iFood_white.svg')),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [mainColorGradient, mainColor],
                begin: FractionalOffset(0.0, 0.0))),
      ),
    );
  }

  void delay(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, BodyWalkthrough.routeName, (route) => false);
    });
  }
}
