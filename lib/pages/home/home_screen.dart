import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/bottom_bar.dart';

import 'components/body_home.dart';
class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyHome(),
      bottomNavigationBar: BottomBar(),
    );
  }
}