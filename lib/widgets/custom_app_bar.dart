import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon, rightIcon;
  final Function? leftCallBack, rightCallBack;
  CustomAppBar(this.leftIcon, this.rightIcon,
      {this.leftCallBack, this.rightCallBack});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: leftCallBack != null ? () => leftCallBack!() : null,
          child: Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
            child: Icon(
              leftIcon,
              size: 19,
              color: Colors.white,
            ),
          ),
        ),
        GestureDetector(
          onTap: rightCallBack != null ? () => rightCallBack!() : null,
          child: Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
            child: Icon(
              rightIcon,
              size: 23,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
