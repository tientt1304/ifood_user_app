import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/updateProfile/components/body_update_profile.dart';
import '../../constants.dart';

class UpdateProfileScreen extends StatelessWidget {
  static String routeName = '/updateprofile';
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          iconSize: 21,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Update Profile',
            style: TextStyle(
                color: kTitleColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'FSSemiBold')),
        centerTitle: true,
      ),
      body: BodyUpdateProfile(),
    );
  }
}
