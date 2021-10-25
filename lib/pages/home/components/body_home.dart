import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/home/components/search_field.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.02,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Welcome back, Tien!',
                style: TextStyle(
                  fontFamily: 'FSBold',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SearchField(),
          ],
        ),
      )),
    );
  }
}
