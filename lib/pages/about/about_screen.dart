import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';

import '../../SizeConfig.dart';
import 'components/body_about.dart';

class AboutScreen extends StatelessWidget {
  static String routeName = '/AboutScreen';
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
         title: Text('About', style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold), ),
         centerTitle: true,
      ),
      body: BodyAbout(),
    );
  }
}