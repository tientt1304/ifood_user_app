import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

import '../../../SizeConfig.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  String? err;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  late String msg;
  void sentMsg() {
    Fluttertoast.showToast(msg: msg);
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
              height: SizeConfig.screenHeight! * 0.02,
            ),
            MainButton(
                title: 'Continue',
                onPress: () {
                  _resetPassword();
                })
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() => TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newvalue) => _emailController.text = newvalue.toString(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/email.svg'),
      ));

  _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.sendPasswordResetEmail(email: _emailController.text);
        this.msg = 'Email has been sent to ${_emailController.text}';
        this.sentMsg();
        Navigator.pop(context);
        throw UnimplementedError;
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            err = "Your email address appears to be malformed.";
            break;
          case "user-not-found":
            err = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            err = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            err = "Too many requests";
            break;
          default:
            err = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: err!);
        print(error.code);
      }
    }
  }
}
