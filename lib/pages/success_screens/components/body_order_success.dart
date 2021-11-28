import 'package:flutter/material.dart';
import 'package:ifood_user_app/rating/rating_screen.dart';
import 'package:ifood_user_app/widgets/success_sceen.dart';

class BodyOrderSuccess extends StatelessWidget {
  const BodyOrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      text: 'Order successful',
      onPress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, RatingScreen.routeName, (route) => false);
      },
    );
  }
}
