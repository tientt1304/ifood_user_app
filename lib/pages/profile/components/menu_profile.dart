import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';



class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

   @override
  Widget build(BuildContext context) {
    return   Container(
            height: SizeConfig.screenHeight! * 0.12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MaterialButton(
                elevation: 1,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: kgrey,
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                      width: SizeConfig.screenWidth! * 0.06,
                      color: mainColorGradient,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      width: 9,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
        