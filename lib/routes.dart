import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/cart/cart_screen.dart';
import 'package:ifood_user_app/pages/complete_profile/complete_profile_screen.dart';
import 'package:ifood_user_app/pages/confirm_password/confirm_password_screen.dart';
import 'package:ifood_user_app/pages/forgot_password/forgot_password_screen.dart';
import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/pages/home/home_screen.dart';
import 'package:ifood_user_app/pages/notification/notification_screen.dart';
import 'package:ifood_user_app/pages/otp_verify/otp_verify_screen.dart';
import 'package:ifood_user_app/pages/profile/profile_screen.dart';
import 'package:ifood_user_app/pages/register/register_screen.dart';
import 'package:ifood_user_app/pages/sign_in/sign_in_screen.dart';
import 'package:ifood_user_app/pages/success_screens/login_success_screen.dart';
import 'package:ifood_user_app/pages/success_screens/register_success_screen.dart';
import 'package:ifood_user_app/pages/success_screens/reset_password_sreen.dart';
import 'package:ifood_user_app/pages/walkthrough/components/body_walkthrough.dart';
import 'package:ifood_user_app/pages/walkthrough/walkthrough_screen.dart';
import 'pages/walkthrough/components/splash_screen.dart';

final routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (context) => SplashScreen(),
  WalkthroughScreen.routeName: (context) => WalkthroughScreen(),
  BodyWalkthrough.routeName: (context) => BodyWalkthrough(),
  GetStartedScreen.routeName: (context) => GetStartedScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  ConfirmPasswordScreen.routeName: (context) => ConfirmPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  RegisterSuccessScreen.routeName: (context) => RegisterSuccessScreen(),
  ResetPasswordSuccessScreen.routeName: (context) =>
      ResetPasswordSuccessScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OTPVerifyScreen.routeName: (context) => OTPVerifyScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen()
};
