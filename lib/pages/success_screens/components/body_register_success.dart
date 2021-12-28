import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/bottom_bar/bottom_bar.dart';
import 'package:ifood_user_app/widgets/success_sceen.dart';

class BodyRegisterSuccess extends StatefulWidget {
  const BodyRegisterSuccess({Key? key}) : super(key: key);

  @override
  State<BodyRegisterSuccess> createState() => _BodyRegisterSuccessState();
}

class _BodyRegisterSuccessState extends State<BodyRegisterSuccess> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(
          context, BottomBar.routeName, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      text: 'Register successful',
    );
  }
}
