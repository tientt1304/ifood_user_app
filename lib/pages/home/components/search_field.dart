import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: SizeConfig.screenWidth! * 0.9,
          decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(13),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'What do you want to order?',
                prefixIcon: Icon(
                  Icons.search,
                  color: mainColor,
                )),
          )),
    );
  }
}
