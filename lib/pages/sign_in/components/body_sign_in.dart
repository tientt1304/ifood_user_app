import 'package:flutter/material.dart';
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
              TitleContent(title: 'Welcome Back',content: 'Sign in with your email and password \nor continue with social media',)
            ],
          ),
        ),
      ),
    );
  }
}
