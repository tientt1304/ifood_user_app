import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/models/user_model.dart';
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
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? err;
  bool agree = false;

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
              child: buildPasswordTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildConfirmPasswordTextField(),
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
            MainButton(
                title: 'Continue',
                onPress: () {
                  _onSignUp(_emailController.text, _passwordController.text);
                  // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                })
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() => TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newvalue) => _emailController.text = newvalue!,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return 'kInvalidEmailError';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/email.svg'),
      ));

  TextFormField buildPasswordTextField() => TextFormField(
        controller: _passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kPassNullError;
          } else if (value.length < 6) {
            return kShortPassError;
          }
          return null;
        },
        obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Enter your password',
          labelText: 'Password',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/lock.svg'),
        ),
      );
  TextFormField buildConfirmPasswordTextField() => TextFormField(
        controller: _confirmPasswordController,
        validator: (value) {
          if (_confirmPasswordController.text != _passwordController.text) {
            return "Password don't match";
          }
          return null;
        },
        obscureText: true,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Confirm your password',
          labelText: 'Re-password',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/lock.svg'),
        ),
      );
  void _onSignUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postSignUpToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            err = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            err = "Your password is wrong.";
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
          case "operation-not-allowed":
            err = "Signing in with Email and Password is not enabled.";
            break;
          default:
            err = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: err!);
        print(error.code);
      }
    }
  }

  postSignUpToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushNamed(context, CompleteProfileScreen.routeName);
  }
}
