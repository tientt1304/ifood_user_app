import 'package:flutter/material.dart';

import 'components/body_on_going.dart';

class OnGoingScreen extends StatelessWidget {
  static String routeName = '/ongoing';
  const OnGoingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyOnGoing());
  }
}
