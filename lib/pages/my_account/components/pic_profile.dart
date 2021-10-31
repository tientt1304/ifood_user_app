

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';

class Picprofile extends StatelessWidget {
  const Picprofile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.15,
      width: SizeConfig.screenWidth! * 0.3,
      child: Column(
        children: [
          Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile_image.png"),
                radius: 60,
              ),
              Positioned(
                right: -18,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    color: kgrey,
                    onPressed: () {},
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
          Text(
                'TUNE',
                style: TextStyle(color: kTextColor, fontSize: 16, fontWeight: FontWeight.w600),
              ),
        ],
      ),
    );
  }
}
