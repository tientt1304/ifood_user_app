import 'package:flutter/material.dart';

class BodyAbout extends StatelessWidget {
  const BodyAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text('Satisfy your cravings by getting the food you love from your favorite restaurants. iFood is now available in areas of Metro Manila, Rizal, Cavite, Laguna, Pampanga, Cebu and will be expanding quickly to other areas soon!',
      textAlign: TextAlign.center,),
    );
  }
}