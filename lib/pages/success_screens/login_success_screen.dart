import 'package:flutter/material.dart';

import 'components/body_login_success.dart';
class LoginSuccessScreen extends StatelessWidget {
  static String routeName = '/loginsuccess';
  const LoginSuccessScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyLoginSuccess(),
    );
  }
}