import 'package:flutter/material.dart';

class BodyAbout extends StatelessWidget {
  const BodyAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Project iFood Application is written by iFood Team:',
                textAlign: TextAlign.justify,
                style: TextStyle(height: 2, wordSpacing: 2)),
            Text('\t 18521495 - Truong Thao Tien',
                textAlign: TextAlign.justify,
                style: TextStyle(height: 2, wordSpacing: 2)),
            Text('\t 18521580 - Ho Van Anh Tu',
                textAlign: TextAlign.justify,
                style: TextStyle(height: 2, wordSpacing: 2)),
            Text('With the assistance of instructor Dang Le Bao Chuong.',
                textAlign: TextAlign.justify,
                style: TextStyle(height: 2, wordSpacing: 2)),
          ],
        ),
      ),
    );
  }
}
