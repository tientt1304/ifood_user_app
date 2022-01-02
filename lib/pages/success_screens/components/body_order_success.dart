import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/bottom_bar/bottom_bar.dart';
import 'package:ifood_user_app/widgets/success_sceen.dart';

class BodyOrderSuccess extends StatefulWidget {
  const BodyOrderSuccess({Key? key}) : super(key: key);

  @override
  State<BodyOrderSuccess> createState() => _BodyOrderSuccessState();
}

class _BodyOrderSuccessState extends State<BodyOrderSuccess> {
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
      text: 'Order successful',
    );
  }
}
