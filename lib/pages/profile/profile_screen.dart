import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/profile/components/body_profile.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BodyProfile(),
    );
  }
}
