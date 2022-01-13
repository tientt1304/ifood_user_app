import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';

class WalkthroughContent extends StatelessWidget {
  const WalkthroughContent({Key? key, this.title, this.text, this.image})
      : super(key: key);
  final title, text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          image,
          height: SizeConfig.screenHeight! * 0.6,
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'FSBold',
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(50),
              vertical: getProportionateScreenHeight(10)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'FSLight', fontSize: 13),
          ),
        )
      ],
    );
  }
}
