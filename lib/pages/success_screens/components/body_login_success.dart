import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/bottom_bar/bottom_bar.dart';
import 'package:ifood_user_app/widgets/success_sceen.dart';

class BodyLoginSuccess extends StatefulWidget {
  const BodyLoginSuccess({Key? key}) : super(key: key);

  @override
  State<BodyLoginSuccess> createState() => _BodyLoginSuccessState();
}

class _BodyLoginSuccessState extends State<BodyLoginSuccess> {
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
      text: 'Login successful',
    );
  }
}
