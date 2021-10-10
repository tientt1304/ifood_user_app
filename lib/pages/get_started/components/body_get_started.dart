import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/sign_in/sign_in_screen.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/buttons/primary_button.dart';

class BodyGetStarted extends StatelessWidget {
  const BodyGetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/icons/Logo.png'),
              ),
              SvgPicture.asset('assets/icons/iFood.svg'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(50),
                    getProportionateScreenHeight(5),
                    getProportionateScreenWidth(50),
                    getProportionateScreenHeight(50)),
                child: Text(
                  'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              MainButton(title: 'Login', onPress: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              }),
              PrimaryButton(title: 'Create an account', onPress: () {})
            ],
          ),
        )
      ],
    );
  }
}
