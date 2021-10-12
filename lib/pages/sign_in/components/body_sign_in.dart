import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/sign_in/components/sign_in_form.dart';
import 'package:ifood_user_app/widgets/buttons/social_card.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

class BodySignIn extends StatelessWidget {
  const BodySignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                title: 'Welcome Back',
                content:
                    'Sign in with your email and password \nor continue with social media',
              ),
              SignInForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
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
