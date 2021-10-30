import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/update_profile/components/update_profile_form.dart';

import 'package:ifood_user_app/widgets/contents/title_content.dart';

import '../../../SizeConfig.dart';

class BodyUpdateProfile extends StatelessWidget {
  const BodyUpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                title: 'Update Profile Account',
                content:
                    'Complete your details \nor continue with social media',
              ),
              UpdateProfileForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
