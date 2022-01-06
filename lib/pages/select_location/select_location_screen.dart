import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/select_location/components/location_map.dart';

class SetLocationScreen extends StatelessWidget {
  static String routeName = '/setlocation';
  const SetLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationMap(),
    );
  }
}
