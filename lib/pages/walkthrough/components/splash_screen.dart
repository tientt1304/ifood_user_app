import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/walkthrough/components/body_walkthrough.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    delay(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: SvgPicture.asset('assets/icons/iFood_white.svg')
          ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [mainColorGradient, mainColor],
                begin: FractionalOffset(0.0, 0.0)
                )),
      ),
    );
  }

  void delay(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, BodyWalkthrough.routeName);
    });
  }
}
