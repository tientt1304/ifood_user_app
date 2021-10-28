import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/update_location/components/body_update_location.dart';

class UpdateLocationScreen extends StatelessWidget {
  static String routeName = '/updatelocation';
  const UpdateLocationScreen({Key? key}) : super(key: key);

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
          'Set Location',
          style: TextStyle(
              color: kTitleColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'FSSemiBold'),
        ),
        centerTitle: true,
      ),
      body: BodyUpdateLocation(),
    );
  }
}
