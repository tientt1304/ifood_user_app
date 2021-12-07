import 'package:flutter/material.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';
import '../../../SizeConfig.dart';

class MyAccountForm extends StatefulWidget {
  final UserModel userModel;
  final String uid;
  MyAccountForm(this.userModel, this.uid);

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
    //print(widget.userModel.email);
  }

  initInfo() async {
    _fNameController.text = this.widget.userModel.fName.toString();
    _lNameController.text = this.widget.userModel.lName.toString();
    _phoneNumberController.text = this.widget.userModel.phoneNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userModel.fName == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Padding(
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
              title: 'Save',
              onPress: () {},
            ),
          ],
        ),
      );
    }
  }

  TextFormField buildPhoneNumberTextField() => TextFormField(
        onChanged: (value) {
          _phoneNumberController.text = value;
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
          _lNameController.text = value.toString();
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
          labelText: 'First Name',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/person.svg'),
        ),
      );
}
