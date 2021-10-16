import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import 'components/body_notification.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = '/notification';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyNotification(),
    );
  }
}
