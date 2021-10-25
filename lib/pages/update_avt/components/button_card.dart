import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonCard extends StatelessWidget {
  ButtonCard({Key? key, required this.img, required this.text})
      : super(key: key);
  final String img, text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFE3E3E3).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 2),
              )
            ]),
        width: double.infinity,
        child: Material(
          child: Column(
            children: [
              SvgPicture.asset(img),
              Text(
                text,
                style: TextStyle(
                    fontFamily: 'FSBold',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
