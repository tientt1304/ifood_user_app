import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../SizeConfig.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({Key? key, required this.icon, required this.onPress})
      : super(key: key);
  final String icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        padding: EdgeInsets.all(getProportionateScreenWidth(9)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
