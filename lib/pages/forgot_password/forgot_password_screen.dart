import 'package:flutter/material.dart';

import 'components/body_forgot_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgotPassword';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          iconSize: 21,
          onPressed: () => Navigator.of(context).pop(),
          ),
        title: Text('Forgot Password'),
        centerTitle: true,
      ),
      body: BodyForgotPassword(),
    );
  }
}
