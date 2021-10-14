import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/success_screens/login_success_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

import '../../../SizeConfig.dart';
class ConfirmPasswordForm extends StatefulWidget {
  const ConfirmPasswordForm({ Key? key }) : super(key: key);

  @override
  _ConfirmPasswordFormState createState() => _ConfirmPasswordFormState();
}

class _ConfirmPasswordFormState extends State<ConfirmPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? password, repassword;

  final List<String> errors = [];
  
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
         padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.06,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPasswordTextField(hint: 'Enter your new password'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPasswordTextField(hint: 'Re-enter your new password'),
            ),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            MainButton(title: 'Continue', onPress: (){
              if(password == repassword){
                setState(() {
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                });
              }
            })
          ],
        ),
      ),
    );
  }
  TextFormField buildPasswordTextField({String? hint}) => TextFormField(
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
            removeError(error: kShortPassError);
          }
        },
        validator: (value) {
          if ((value == null || value.isEmpty) &&
              !errors.contains(kPassNullError)) {
            addError(error: kPassNullError);
            return '';
          } else if (value != null &&
              value.length < 8 &&
              !errors.contains(kRePassNullError) &&
              !errors.contains(kShortPassError)) {
            addError(error: kShortPassError);
            return '';
          } else if (errors.contains(kPassNullError) ||
              errors.contains(kShortPassError)) {
            return '';
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: hint,
          labelText: 'Password',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/lock.svg'),
        ),
      );
}