import 'package:flutter/material.dart';

import 'SizeConfig.dart';

const mainColor = Color(0xFFFF7643);
final mainColorGradient = Color(0xFFFF7643).withOpacity(0.44);
const primaryColor = Color(0xFFFF806F);
const secondaryColor = Color(0xFF979797);
const blurTextColor = Color(0xFF3B3B3B);
const splitColor = Color(0xFFE9E9E9);
const kred = Color(0xFFFF4B4B);
const kgrey = Color(0xFFE9E9E9);
const kWarningColor = Color(0xFFFF4848);
const bgColor = Color(0xFFFFF2ED);
const kTextColor = Color(0xFF757575);
const kTitleColor = Color(0xFF313131);
final mainGradient =
    LinearGradient(colors: [mainColor.withOpacity(0.77), mainColor]);

const kAnimationDuration = Duration(milliseconds: 300);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(borderColor: mainColor),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder(
    {double borderRadius = 15, Color borderColor = secondaryColor}) {
  return OutlineInputBorder(
    borderRadius:
        BorderRadius.circular(getProportionateScreenWidth(borderRadius)),
    borderSide: BorderSide(color: borderColor),
  );
}
