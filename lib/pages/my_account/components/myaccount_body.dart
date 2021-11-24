import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/my_account/components/myaccount_form.dart';

class BodyMyAccount extends StatelessWidget {
  const BodyMyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.012),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.012),
            child: MyAccountForm(),
          ),
        ],
      ),
    );
  }
}
