import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import 'components/body_get_started.dart';

class GetStartedScreen extends StatelessWidget {
  static String routeName = '/get_statered';
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyGetStarted(),
    );
  }
}