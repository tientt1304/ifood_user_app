import 'package:flutter/material.dart';

import 'components/body_otp_verify.dart';

class OTPVerifyScreen extends StatelessWidget {
  static String routeName = '/otpverify';
  const OTPVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          iconSize: 21,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('OTP Verification'),
        centerTitle: true,
      ),
      body: BodyOTPVerify(),
    );
  }
}
