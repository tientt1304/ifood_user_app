import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/update_avt/components/body_update_avt.dart';

import '../../constants.dart';

class UpdateAvtScreen extends StatelessWidget {
  static String routeName = '/updateavt';
  const UpdateAvtScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          iconSize: 21,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Upload Photo',
          style: TextStyle(
              color: kTitleColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'FSSemiBold'),
        ),
        centerTitle: true,
      ),
      body: BodyUpdateAvt(),
    );
  }
}
