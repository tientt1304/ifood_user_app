import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/walkthrough/components/splash_screen2.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    delay(context);
    return Scaffold(
      body: Stack(children: [
        Image.asset('assets/images/bg.png'),
        Center(child: Image.asset('assets/icons/iFood.png')),
      ]),
    );
  }

  void delay(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, SplashScreen2.routeName);
    });
  }
}
