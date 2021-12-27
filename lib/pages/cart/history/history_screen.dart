import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/cart/history/components/body_history.dart';

class HistoryScreen extends StatelessWidget {
  static String routeName = '/history';
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyHistory());
  }
}
