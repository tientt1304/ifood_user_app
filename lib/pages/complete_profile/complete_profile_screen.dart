import 'package:flutter/material.dart';

import 'components/body_complete_profile.dart';


class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/completeprofile';
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          iconSize: 21,
          onPressed: () => Navigator.of(context).pop(),
          ),
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: BodyCompleteProfile(),
    );
  }
}
