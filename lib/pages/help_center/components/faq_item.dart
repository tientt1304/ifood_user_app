import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';

class FAQItem extends StatelessWidget {
  const FAQItem({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenHeight(5),
        0,
        getProportionateScreenHeight(5),
        getProportionateScreenHeight(5),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(5),
          ),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              color: const Color(0xFFD8D8D8).withOpacity(0.6),
            )),
          ),
          child: Text(
            content,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
