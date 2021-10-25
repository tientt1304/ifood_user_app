import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body_sign_in.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/signin';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          iconSize: 21,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Sign In',
          style: TextStyle(
              color: kTitleColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'FSSemiBold'),
        ),
        centerTitle: true,
      ),
      body: BodySignIn(),
    );
  }
}
