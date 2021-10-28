import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/bottom_bar/bottom_bar.dart';
import 'package:ifood_user_app/widgets/success_sceen.dart';

class BodyRegisterSuccess extends StatelessWidget {
  const BodyRegisterSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      text: 'Register successful',
      onPress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, BottomBar.routeName, (route) => false);
      },
    );
  }
}
