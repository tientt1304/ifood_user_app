import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/pages/update_avt/update_avt_screen.dart';
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

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPhoneNumberTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildFirstNameTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildLastNameTextField(),
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
      textInputAction: TextInputAction.next,
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

  TextFormField buildPasswordTextField() => TextFormField(
        controller: _passwordController,
        onSaved: (newValue) => _passwordController.text = newValue.toString(),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kPassNullError;
          } else if (value.length < 6) {
            return kShortPassError;
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
  TextFormField buildConfirmPasswordTextField() => TextFormField(
        controller: _confirmPasswordController,
        onSaved: (newValue) => _passwordController.text = newValue.toString(),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kPassNullError;
          } else if (value != _passwordController.text) {
            return kMatchPassError;
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Re-enter your password',
          labelText: 'Password',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/lock.svg'),
        ),
      );
  TextFormField buildPhoneNumberTextField() => TextFormField(
        onSaved: (value) {
          _phoneNumberController.text = value!;
        },
        controller: _phoneNumberController,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value != null && !phoneNumberValidatorRegExp.hasMatch(value)) {
            return kInvalidPhoneNummberError;
          } else if (value == null || value.isEmpty) {
            return kPhoneNumberNullError;
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Enter your phone number',
          labelText: 'Phone Number',
          suffixIcon:
              CustomSuffixIcon(svgIconSrc: 'assets/icons/phone_android.svg'),
        ),
      );
  TextFormField buildLastNameTextField() => TextFormField(
        controller: _lNameController,
        onSaved: (value) {
          _lNameController.text = value.toString();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          hintText: 'Enter your last name',
          labelText: 'Last Name',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/person.svg'),
        ),
      );
  TextFormField buildFirstNameTextField() => TextFormField(
        controller: _fNameController,
        onSaved: (value) {
          _fNameController.text = value.toString();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          hintText: 'Enter your first name',
          labelText: 'First Name',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/person.svg'),
        ),
      );
  void _onSignUp(String email, String password) async {
    if (_formKey.currentState!.validate() && agree == true) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  postDetailsToFireStore(),
                  Fluttertoast.showToast(msg: "Register Successful"),
                  Navigator.pushNamed(context, UpdateAvtScreen.routeName),
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

  postDetailsToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.uid = user!.uid;
    userModel.email = _emailController.text;
    userModel.phoneNumber = _phoneNumberController.text;
    userModel.fName = _fNameController.text;
    userModel.lName = _lNameController.text;
    await firebaseFirestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toJSON());
    Navigator.pushNamedAndRemoveUntil(
        context, UpdateAvtScreen.routeName, (route) => false);
  }
}
