import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';
import '../../../SizeConfig.dart';

class MyAccountForm extends StatefulWidget {
  final String uid;
  final UserModel userModel;
  MyAccountForm(this.uid, this.userModel);
  @override
  _MyAccountFormState createState() => _MyAccountFormState();
}

class _MyAccountFormState extends State<MyAccountForm> {
  TextEditingController _fNameController = TextEditingController();
  TextEditingController _lNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initInfo();
    print(widget.uid);
  }

  initInfo() async {
    _fNameController.text = this.widget.userModel.fName.toString();
    _lNameController.text = this.widget.userModel.lName.toString();
    _phoneNumberController.text = this.widget.userModel.phoneNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth! * 0.06,
      ),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.01),
            child: buildFirstNameTextField(),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.01),
            child: buildLastNameTextField(),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.01),
            child: buildPhoneNumberTextField(),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          MainButton(
            title: 'Save',
            onPress: updateDetailsToFireStore,
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() => TextFormField(
        onChanged: (value) {
          _phoneNumberController
            ..text = value.toString()
            ..selection = TextSelection.collapsed(
                offset: _phoneNumberController.text.length);
        },
        controller: _phoneNumberController,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value != null && !phoneNumberValidatorRegExp.hasMatch(value)) {
            return kInvalidPhoneNummberError;
          } else if (value == null || value.isEmpty) {
            return kPhoneNumberNullError;
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          suffixIcon:
              CustomSuffixIcon(svgIconSrc: 'assets/icons/phone_android.svg'),
        ),
      );
  TextFormField buildLastNameTextField() => TextFormField(
        controller: _lNameController,
        onChanged: (value) {
          _lNameController
            ..text = value.toString()
            ..selection =
                TextSelection.collapsed(offset: _lNameController.text.length);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Last Name',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/person.svg'),
        ),
      );
  TextFormField buildFirstNameTextField() => TextFormField(
        controller: _fNameController,
        onChanged: (value) {
          _fNameController
            ..text = value.toString()
            ..selection =
                TextSelection.collapsed(offset: _fNameController.text.length);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'First Name',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/person.svg'),
        ),
      );
  updateDetailsToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    //User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    // DocumentSnapshot currentAvatar = await firebaseFirestore
    //     .collection('users')
    //     .doc(user!.uid.toString())
    //     .get();
    //userModel.uid = user.uid;
    userModel.phoneNumber = _phoneNumberController.text;
    userModel.fName = _fNameController.text;
    userModel.lName = _lNameController.text;
    await firebaseFirestore
        .collection('users')
        .doc(userModel.uid)
        .update(userModel.updateProfile());
    // if (currentAvatar['avatar'] != avtUrl) {
    //   userModel.avatar = avtUrl;
    //   await firebaseFirestore
    //       .collection('users')
    //       .doc(userModel.uid)
    //       .update(userModel.avtToJSON());
    // }

    Fluttertoast.showToast(msg: 'Update information successful!');
  }
}
