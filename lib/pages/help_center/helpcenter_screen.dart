import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/help_center/components/body_helpcenter.dart';

class HelpCenterScreen extends StatelessWidget {
  static String routeName = "/HelpCenterScreen";

  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
        centerTitle: true,
      ),
      body: const HelpCenterBody(),
    );
  }
}