import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import 'components/body_home.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyHome(),
    );
  }
}
