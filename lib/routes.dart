import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/about/about_screen.dart';
import 'package:ifood_user_app/pages/cart/cart_screen.dart';
import 'package:ifood_user_app/pages/cart/history/history_screen.dart';
import 'package:ifood_user_app/pages/cart/on_going/on_going_screen.dart';
import 'package:ifood_user_app/pages/cart/shopping_cart/shopping_cart_screen.dart';
import 'package:ifood_user_app/pages/category/category_screen.dart';
import 'package:ifood_user_app/pages/check_out/check_out_screen.dart';
import 'package:ifood_user_app/pages/forgot_password/forgot_password_screen.dart';
import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/pages/help_center/helpcenter_screen.dart';
import 'package:ifood_user_app/pages/home/home_screen.dart';
import 'package:ifood_user_app/pages/my_account/myaccount_screen.dart';
import 'package:ifood_user_app/pages/notification/notification_screen.dart';
import 'package:ifood_user_app/pages/profile/profile_screen.dart';
import 'package:ifood_user_app/pages/rating/rating_screen.dart';
import 'package:ifood_user_app/pages/register/register_screen.dart';
import 'package:ifood_user_app/pages/select_location/set_location_screen.dart';
import 'package:ifood_user_app/pages/sign_in/sign_in_screen.dart';
import 'package:ifood_user_app/pages/success_screens/login_success_screen.dart';
import 'package:ifood_user_app/pages/success_screens/order_cuccess_screen.dart';
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
  OrderSuccessScreen.routeName: (context) => OrderSuccessScreen(),
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
  SetLocationScreen.routeName: (context) => SetLocationScreen(),
  ShoppingCartScreen.routeName: (context) => ShoppingCartScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  HelpCenterScreen.routeName: (context) => HelpCenterScreen(),
  //RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(),
  CheckOutScreen.routeName: (context) => CheckOutScreen(),
  RatingScreen.routeName: (context) => RatingScreen(),
  OnGoingScreen.routeName: (context) => OnGoingScreen(),
  HistoryScreen.routeName: (context) => HistoryScreen()
};
