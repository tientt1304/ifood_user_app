import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ifood_user_app/pages/cart/cart_screen.dart';
import 'package:ifood_user_app/pages/home/home_screen.dart';
import 'package:ifood_user_app/pages/notification/notification_screen.dart';
import 'package:ifood_user_app/pages/profile/profile_screen.dart';

import '../../constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          )
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GNav(
              rippleColor: mainColor.withOpacity(0.7),
              hoverColor: mainColor.withOpacity(0.8),
              haptic: true, // haptic feedback
              tabBorderRadius: 20,
              duration: Duration(milliseconds: 200), // tab animation duration
              gap: 6, // the tab button gap between icon and text
              color: mainColor.withOpacity(0.9), // unselected icon color
              activeColor: Colors.white, // selected icon and text color
              iconSize: 30, // tab button icon size
              tabBackgroundColor: mainColor.withOpacity(0.9),
              //mainColor.withOpacity(0.7), // selected tab background color
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  onPressed: () {
                    setState(() {
                      currentScreen = HomeScreen();
                      _selectedIndex = 0;
                    });
                  },
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Order',
                  onPressed: () {
                    setState(() {
                      currentScreen = CartScreen();
                      _selectedIndex = 0;
                    });
                  },
                ),
                GButton(
                  icon: Icons.notifications_none,
                  text: 'Notification',
                  onPressed: () {
                    setState(() {
                      currentScreen = NotificationScreen();
                      _selectedIndex = 0;
                    });
                  },
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                  onPressed: () {
                    setState(() {
                      currentScreen = ProfileScreen();
                      _selectedIndex = 0;
                    });
                  },
                )
              ],
              selectedIndex: _selectedIndex,
              // onTabChange: (index) {
              //   setState(() {
              //     _selectedIndex = index;
              //   });
              //},
            ),
          ),
        ),
      ),
    );
  }
}
//SvgPicture.asset('assets/icons/home.svg')
