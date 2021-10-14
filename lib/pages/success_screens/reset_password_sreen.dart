import 'package:flutter/material.dart';

import 'components/body_reset_success.dart';

class ResetPasswordSuccessScreen extends StatelessWidget {
  static String routeName = '/resetpasswordsuccess';
  const ResetPasswordSuccessScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyResetPasswordSuccess(),
    );
  }
}