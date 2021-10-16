import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/profile/components/body_profile.dart';

import '../../SizeConfig.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyProfile(),
    );
  }
}
