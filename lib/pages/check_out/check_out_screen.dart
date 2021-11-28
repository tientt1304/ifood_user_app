import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/check_out/components/body_check_out.dart';

class CheckOutScreen extends StatelessWidget {
  static String routeName = '/checkout';
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: 21,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Check Out',
              style: TextStyle(
                  color: kTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FSSemiBold')),
          centerTitle: true,
        ),
        body: BodyCheckOut());
  }
}
