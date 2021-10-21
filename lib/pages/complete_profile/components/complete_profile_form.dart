import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/pages/otp_verify/otp_verify_screen.dart';
import 'package:ifood_user_app/pages/success_screens/register_success_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

import '../../../SizeConfig.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _fNameController = new TextEditingController();
  final _lNameController = new TextEditingController();
  final _phoneNumberController = new TextEditingController();

  String? err;

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
              child: buildFirstNameTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildLastNameTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPhoneNumberTextField(),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.02,
            ),
            MainButton(
                title: 'Continue',
                onPress: () {
                  _onCompleteProfile(_fNameController.text,
                      _lNameController.text, _phoneNumberController.text);
                })
          ],
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() => TextFormField(
        onSaved: (newValue) => _phoneNumberController.text = newValue!,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kPhoneNumberNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          hintText: 'Enter your phone number',
          labelText: 'Phone Number',
          suffixIcon:
              CustomSuffixIcon(svgIconSrc: 'assets/icons/phone_android.svg'),
        ),
      );
  TextFormField buildLastNameTextField() => TextFormField(
        onSaved: (newValue) => _lNameController.text = newValue!,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          hintText: 'Enter your last name',
          labelText: 'Last Name',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/person.svg'),
        ),
      );
  TextFormField buildFirstNameTextField() => TextFormField(
        onSaved: (newValue) => _fNameController.text = newValue!,
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
  void _onCompleteProfile(String fName, String lName, String phoneNumber) {
    if (_formKey.currentState!.validate()) {
      try {} on FirebaseException catch (error) {}
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
    Fluttertoast.showToast(msg: "Update profile successfully :) ");

    Navigator.pushNamed(context, RegisterSuccessScreen.routeName);
  }
}
