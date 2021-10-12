import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/forgot_password/components/forgot_password_form.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

import '../../../SizeConfig.dart';
import '../../../constants.dart';

class BodyForgotPassword extends StatelessWidget {
  const BodyForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                title: 'Forgot Password',
                content:
                    'Please enter your email and we will send you \n a link to return to your account'
              ),
              ForgotPasswordForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.338,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? ', style: TextStyle(
                      fontSize: 16,
                    ),),
                  GestureDetector(
                    onTap: (){},
                    child: Text('Sign up', style: TextStyle(
                      fontSize: 16,
                      color: mainColor,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),     
            ],
          ),
        ),
      ),
    );
  }
}