import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';

import 'components/body_myaccount.dart';

class MyAccountScreen extends StatelessWidget {
  static String routeName = '/MyAccountScreen';
  const MyAccountScreen({Key? key}) : super(key: key);

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
          'My Account',
          style: TextStyle(color: kTitleColor),
        ),
        centerTitle: true,
      ),
      body: BodyMyAccount(),
    );
  }
}
