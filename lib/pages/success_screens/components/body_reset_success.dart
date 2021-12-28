import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/success_sceen.dart';

class BodyResetPasswordSuccess extends StatelessWidget {
  const BodyResetPasswordSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      text: 'Reset password successful',
    );
  }
}
