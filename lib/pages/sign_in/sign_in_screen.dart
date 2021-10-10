import 'package:flutter/material.dart';

import 'components/body_sign_in.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/signin';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: BodySignIn(),
    );
  }
}
