import 'package:flutter/material.dart';

import 'components/body_register_success.dart';

class RegisterSuccessScreen extends StatelessWidget {
  static String routeName = '/registersuccess';
  const RegisterSuccessScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyRegisterSuccess(),
    );
  }
}