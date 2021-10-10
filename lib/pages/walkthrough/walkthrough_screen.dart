import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/walkthrough/components/body_walkthrough.dart';


class WalkthroughScreen extends StatelessWidget {
  static String routeName = '/walkthrough';
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyWalkthrough(),
    );
  }
}