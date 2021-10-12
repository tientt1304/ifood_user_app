import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/confirm_password/components/confirm_password_form.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

class BodyConfirmPassword extends StatelessWidget {
  const BodyConfirmPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(title: 'Confirm Password',
              content: 'Please enter your new password',
              ),
              ConfirmPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}
