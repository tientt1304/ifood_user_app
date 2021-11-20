import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData icon;
  final Function? callBack;
  CustomAppBar(this.icon, {this.callBack});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack != null ? () => callBack!() : null,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              icon,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
