import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/rating/components/body_rating.dart';

class RatingScreen extends StatelessWidget {
  static String routeName = '/rating';
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: 21,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Rating',
              style: TextStyle(
                  color: kTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FSSemiBold')),
          centerTitle: true,
        ),
        body: BodyRating());
  }
}
