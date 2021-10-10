import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/pages/sign_in/sign_in_screen.dart';
import 'package:ifood_user_app/pages/walkthrough/components/body_walkthrough.dart';
import 'package:ifood_user_app/pages/walkthrough/walkthrough_screen.dart';
import 'pages/walkthrough/components/splash_screen.dart';

final routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (context) => SplashScreen(),
  WalkthroughScreen.routeName: (context) => WalkthroughScreen(),
  BodyWalkthrough.routeName: (context) => BodyWalkthrough(),
  GetStartedScreen.routeName: (context) => GetStartedScreen(),  
  SignInScreen.routeName: (context) => SignInScreen(),
};