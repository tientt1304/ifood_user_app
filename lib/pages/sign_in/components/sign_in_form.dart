import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/forgot_password/forgot_password_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  bool remember = false;

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
  void _onSignIn(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      //FocusScope.of(context.requestFocus(FocusNode()));
      //Navigator.of(context).restorablePush(dialogBuilder);      
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
              child: buildEmailTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPasswordTextField(),
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: remember,
                    side: BorderSide(color: secondaryColor, width: 1),
                    activeColor: mainColor,
                    onChanged: (bool? value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                Text('Remember me', style: TextStyle(color: kTextColor),),
                SizedBox(
                  width: SizeConfig.screenWidth!*0.25,
                ),
                GestureDetector(
                  child: Text('Forgot Password', style: TextStyle(color: kTextColor),),
                  onTap: (){
                    Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                  },
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight!*0.02,
            ),
            MainButton(title: 'Continue', onPress: _onSignIn)
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

  TextFormField buildPasswordTextField() => TextFormField(
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
          hintText: 'Enter your password',
          labelText: 'Password',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/lock.svg'),
        ),
      );
}
