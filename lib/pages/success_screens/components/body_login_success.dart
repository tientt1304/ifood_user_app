import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/bottom_bar/bottom_bar.dart';
import 'package:ifood_user_app/widgets/success_sceen.dart';

class BodyLoginSuccess extends StatelessWidget {
  const BodyLoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      text: 'Login successful',
      onPress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, BottomBar.routeName, (route) => false);
      },
    );
  }
}
