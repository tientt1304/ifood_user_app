import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/about/about_screen.dart';
import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/pages/help_center/helpcenter_screen.dart';
import 'package:ifood_user_app/pages/my_account/myaccount_screen.dart';
import 'package:ifood_user_app/pages/notification/notification_screen.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.screenHeight! * 0.015,
          ),
          Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile_image.png"),
                radius: 60,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
              Text(
                'TUNE',
                style: TextStyle(color: kTextColor, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),

  // My Account
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          Container(
            height: SizeConfig.screenHeight! * 0.12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MaterialButton(
                elevation: 1,
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: kgrey,
                onPressed: () {
                  Navigator.pushNamed(context, MyAccountScreen.routeName);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                      width: SizeConfig.screenWidth! * 0.08,
                      color: mainColorGradient,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.05,
                    ),
                    Expanded(
                      child: Text(
                        'My Account',
                        style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      width: SizeConfig.screenWidth! * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Notification
          Container(
            height: SizeConfig.screenHeight! * 0.12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MaterialButton(
                elevation: 1,
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: kgrey,
                onPressed: () {
                  Navigator.pushNamed(context, NotificationScreen.routeName);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/notifications_icon.svg',
                      width: SizeConfig.screenWidth! * 0.08,
                      color: mainColorGradient,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.05,
                    ),
                    Expanded(
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      width: SizeConfig.screenWidth! * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Help center

           Container(
            height: SizeConfig.screenHeight! * 0.12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MaterialButton(
                elevation: 1,
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: kgrey,
                onPressed: () {
                  // Navigator.pushNamed(context, HelpCenterScreen.routeName);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/question_mark_icon.svg',
                      width: SizeConfig.screenWidth! * 0.08,
                      color: mainColorGradient,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.05,
                    ),
                    Expanded(
                      child: Text(
                        'Help center',
                        style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      width: SizeConfig.screenWidth! * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // about

          Container(
            height: SizeConfig.screenHeight! * 0.12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MaterialButton(
                elevation: 1,
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: kgrey,
                onPressed: () {
                  Navigator.pushNamed(context, AboutScreen.routeName);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/about_icon.svg',
                      width: SizeConfig.screenWidth! * 0.08,
                      color: mainColorGradient,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.05,
                    ),
                    Expanded(
                      child: Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      width: SizeConfig.screenWidth! * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Log out

          Container(
            height: SizeConfig.screenHeight! * 0.12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MaterialButton(
                elevation: 1,
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: kgrey,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, GetStartedScreen.routeName, (route) => false);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/logout_icon.svg',
                      width: SizeConfig.screenWidth! * 0.08,
                      color: mainColorGradient,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.05,
                    ),
                    Expanded(
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      width: SizeConfig.screenWidth! * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
