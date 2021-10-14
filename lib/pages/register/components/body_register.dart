import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/register/components/register_form.dart';
import 'package:ifood_user_app/pages/sign_in/sign_in_screen.dart';
import 'package:ifood_user_app/widgets/buttons/social_card.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

import '../../../SizeConfig.dart';
import '../../../constants.dart';

class BodyRegister extends StatelessWidget {
  const BodyRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                title: 'Register Account',
                content: 'Complete your details \nor continue with social media',
              ),
              RegisterForm(),
              Text(
                'Or continue with',
                style: TextStyle(color: kTextColor, fontSize: 16),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialCard(
                      icon: 'assets/icons/google-icon.svg', onPress: () {}),
                  SocialCard(
                      icon: 'assets/icons/facebook-2.svg', onPress: () {}),
                  SocialCard(
                      icon: 'assets/icons/twitter-3.svg', onPress: () {}),
                  SocialCard(
                      icon: 'assets/icons/phone_android.svg', onPress: () {}),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? ', style: TextStyle(
                      fontSize: 16,
                    ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignInScreen.routeName);
                    },
                    child: Text('Sign in', style: TextStyle(
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
