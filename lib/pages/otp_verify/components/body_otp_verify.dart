import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/otp_verify/components/otp_verify_form.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

import '../../../constants.dart';

class BodyOTPVerify extends StatelessWidget {
  const BodyOTPVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                title: 'OTP Verification',
                content:
                    'We sent your code to +84 345 450 *** \nThis code will expired in 00:30',
              ),
              OTPVerifyForm(),
              SizedBox(height: SizeConfig.screenHeight!*0.2,),
              Text(
                'Resend OTP Code',
                style: TextStyle(
                  color: kTextColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
