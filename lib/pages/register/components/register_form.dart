import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/complete_profile/complete_profile_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

import '../../../SizeConfig.dart';
import '../../../constants.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? email, password, repassword;
  bool agree = false;

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
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildEmailTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPasswordTextField(hint: 'Enter your password'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPasswordTextField(hint: 'Re-enter your password'),
            ),
            Row(
              children: [
                Checkbox(
                    value: agree,
                    side: BorderSide(color: secondaryColor, width: 1),
                    activeColor: mainColor,
                    onChanged: (bool? value) {
                      setState(() {
                        agree = value!;
                      });
                    }),
                Text('You agree with our Term and Condition'),
              ],
            ),
            MainButton(title: 'Continue', onPress: (){
              Navigator.pushNamed(context, CompleteProfileScreen.routeName);
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
