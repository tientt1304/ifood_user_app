import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';

import '../../../SizeConfig.dart';

class ButtonLocationCard extends StatelessWidget {
  ButtonLocationCard({Key? key, required this.location, required this.onPress})
      : super(key: key);
  final String location;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          height: SizeConfig.screenHeight! * 0.25,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(5),
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your Location',
                      style: TextStyle(
                          fontFamily: 'FSBold',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/PinLogo.svg'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            location,
                            style: TextStyle(
                              fontFamily: 'FSREgular',
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  MainButton(title: 'Set Location', onPress: onPress)
                ],
              ),
            ),
          )),
    );
  }
}
