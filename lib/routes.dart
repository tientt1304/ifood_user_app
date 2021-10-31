import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/about/about_screen.dart';
import 'package:ifood_user_app/pages/cart/cart_screen.dart';
import 'package:ifood_user_app/pages/forgot_password/forgot_password_screen.dart';
import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/pages/home/home_screen.dart';
import 'package:ifood_user_app/pages/my_account/myaccount_screen.dart';
import 'package:ifood_user_app/pages/notification/notification_screen.dart';
import 'package:ifood_user_app/pages/profile/profile_screen.dart';
import 'package:ifood_user_app/pages/register/register_screen.dart';
import 'package:ifood_user_app/pages/sign_in/sign_in_screen.dart';
import 'package:ifood_user_app/pages/success_screens/login_success_screen.dart';
import 'package:ifood_user_app/pages/success_screens/register_success_screen.dart';
import 'package:ifood_user_app/pages/update_avt/update_avt_screen.dart';
import 'package:ifood_user_app/pages/update_location/update_location_screen.dart';
import 'package:ifood_user_app/pages/walkthrough/components/body_walkthrough.dart';
import 'package:ifood_user_app/pages/walkthrough/walkthrough_screen.dart';
import 'package:ifood_user_app/widgets/bottom_bar/bottom_bar.dart';
import 'pages/walkthrough/components/splash_screen.dart';

final routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (context) => SplashScreen(),
  WalkthroughScreen.routeName: (context) => WalkthroughScreen(),
  BodyWalkthrough.routeName: (context) => BodyWalkthrough(),
  GetStartedScreen.routeName: (context) => GetStartedScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  RegisterSuccessScreen.routeName: (context) => RegisterSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  BottomBar.routeName: (context) => BottomBar(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  UpdateAvtScreen.routeName: (context) => UpdateAvtScreen(),
  UpdateLocationScreen.routeName: (context) => UpdateLocationScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  AboutScreen.routeName: (context) => AboutScreen(),
  MyAccountScreen.routeName: (context) => MyAccountScreen(),
};
