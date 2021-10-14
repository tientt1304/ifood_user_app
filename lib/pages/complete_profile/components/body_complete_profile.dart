import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

import 'complete_profile_form.dart';

class BodyCompleteProfile extends StatelessWidget {
  const BodyCompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                title: 'Complete Profile',
                content: 'Complete your details \nor continue with social media',
              ),
              CompleteProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}