import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/help_center/components/contact_us_item.dart';
import 'package:ifood_user_app/pages/help_center/components/faq_item.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            buildTitle('FAQ'),
            SizedBox(height: getProportionateScreenWidth(10)),
            const FAQItem(content: 'How long is my order delivery time?'),
            const FAQItem(content: 'How to become a iFood seller?'),
            const FAQItem(content: 'How does warranty work on iFood?'),
            const FAQItem(content: "Why I don't accept otp on my phone?"),
            const FAQItem(content: 'How to rate my order products?'),
            SizedBox(height: getProportionateScreenWidth(20)),
            buildTitle('Contact Us'),
            SizedBox(height: getProportionateScreenWidth(10)),
            ContactUsItem(
              icon: 'assets/icons/Conversation.svg',
              description: 'You can chat with us here',
              title: 'Chat iFood now',
            ),
            ContactUsItem(
              icon: 'assets/icons/Mail.svg',
              description: 'Send your question or problem',
              title: 'Send Email',
            ),
            ContactUsItem(
              icon: 'assets/icons/Call.svg',
              description: '0345450642',
              title: 'Costumer Service',
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            const Center(
              child: Text(
                '© Copyright 2021 - iFood Team',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }

  SizedBox buildTitle(String title) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
