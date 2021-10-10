import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifood_user_app/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'FSRegular',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder({Color borderColor = mainColor}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: borderColor),
        gapPadding: 10,
      );

  return InputDecorationTheme(
    errorStyle: const TextStyle(height: 0),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: const TextStyle(
      color: mainColor,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(borderColor: mainColor),
    border: outlineInputBorder(),
    focusedErrorBorder: outlineInputBorder(borderColor: kWarningColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: TextStyle(color: Colors.black, fontSize: 18),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'FSSemibold'));
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: Colors.black),
  );
}
