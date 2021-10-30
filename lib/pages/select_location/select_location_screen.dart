import 'package:flutter/material.dart';

import 'components/body_select_location.dart';

class SelectLocationScreen extends StatelessWidget {
  static String routeName = '/selectlocation';
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodySelectLocation();
  }
}
