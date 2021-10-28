import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/pages/update_avt/update_avt_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

import '../../../SizeConfig.dart';
import '../../../constants.dart';

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({Key? key}) : super(key: key);

  @override
  _UpdateProfileFormState createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fNameController = new TextEditingController();
  final TextEditingController _lNameController = new TextEditingController();
  String? err;
  bool agree = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

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
                  _onUpdateProfile(
                      _fNameController.text, _lNameController.text);
                })
          ],
        ),
      ),
    );
  }

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

  void _onUpdateProfile(String fName, String lName) async {
    if (_formKey.currentState!.validate() && agree == true) {
      try {
        var user = FirebaseAuth.instance.currentUser;
        user!.updateDisplayName(fName + lName).then((value) {
          postDetailsToFirestore();
          print("Profile has been changed successfully");
          //DO Other compilation here if you want to like setting the state of the app
        });
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(msg: err!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.phoneNumber = user!.phoneNumber;
    userModel.fName = _fNameController.text;
    userModel.lName = _lNameController.text;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
    Navigator.pushNamedAndRemoveUntil(
        context, UpdateAvtScreen.routeName, (route) => false);
  }
}
