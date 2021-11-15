import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/select_location/components/location_map.dart';
import 'package:ifood_user_app/pages/select_location/components/location_provider.dart';
import 'package:provider/provider.dart';

class SetLocationScreen extends StatelessWidget {
  static String routeName = '/setlocation';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: LocationMap(),
        ),
      ],
      child: LocationMap(),
    );
  }
}
