import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';

import '../../../SizeConfig.dart';

class OTPVerifyForm extends StatefulWidget {
  const OTPVerifyForm({ Key? key }) : super(key: key);

  @override
  _OTPVerifyFormState createState() => _OTPVerifyFormState();
}

class _OTPVerifyFormState extends State<OTPVerifyForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.06,
        ),
        child: Column(
          children: [
            MainButton(title: 'Continue', onPress: (){}),
          ],
        ),
      ),
    );
  }
}