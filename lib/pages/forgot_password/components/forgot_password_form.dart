import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/confirm_password/confirm_password_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

import '../../../SizeConfig.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  final List<String> errors = [];
  void addError({String? error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error!);
      });
    }
  }
  void removeError({String? error}){
    if(errors.contains(error)){
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
          children: [
            buildEmailTextField(),
            SizedBox(
              height: SizeConfig.screenHeight!*0.02,
            ),
            MainButton(title: 'Continue', onPress: (){
              Navigator.pushNamed(context, ConfirmPasswordScreen.routeName);
            })
          ],
        ),
      ),
    );
  }
  TextFormField buildEmailTextField() => TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newvalue) => email = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kEmailNullError)) {
          addError(error: kEmailNullError);
          return '';
        } else if (value != null &&
            !emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError) &&
            !errors.contains(kEmailNullError)) {
          addError(error: kInvalidEmailError);
          return '';
        } else if (errors.contains(kEmailNullError) ||
            errors.contains(kInvalidEmailError)) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/email.svg'),
      ));

}


