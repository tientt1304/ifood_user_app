import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/otp_verify/otp_verify_screen.dart';
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
  final _formKey = GlobalKey<FormState>();
  String? fName, lName, phone;
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
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            MainButton(title: 'Continue', onPress: (){
              Navigator.pushNamed(context, OTPVerifyScreen.routeName);
            })
          ],
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() => TextFormField(
        onSaved: (newValue) => phone = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
            removeError(error: kPhoneNumberNullError);
          }
        },
        validator: (value) {
          if ((value == null || value.isEmpty) &&
              !errors.contains(kPhoneNumberNullError)) {
            addError(error: kPhoneNumberNullError);

            return '';
          } else if (errors.contains(kPhoneNumberNullError)) {
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Enter your phone number',
          labelText: 'Phone Number',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/phone_android.svg'),
        ),
      );
  TextFormField buildLastNameTextField() => TextFormField(
        onSaved: (newValue) => lName = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNamelNullError)) {
            removeError(error: kNamelNullError);
          }
        },
        validator: (value) {
          if ((value == null || value.isEmpty) &&
              !errors.contains(kNamelNullError)) {
            addError(error: kNamelNullError);

            return '';
          } else if (errors.contains(kNamelNullError)) {
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Enter your last name',
          labelText: 'Last Name',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/person.svg'),
        ),
      );
  TextFormField buildFirstNameTextField() => TextFormField(
        onSaved: (newValue) => fName = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNamelNullError)) {
            removeError(error: kNamelNullError);
          }
        },
        validator: (value) {
          if ((value == null || value.isEmpty) &&
              !errors.contains(kNamelNullError)) {
            addError(error: kNamelNullError);

            return '';
          } else if (errors.contains(kNamelNullError)) {
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Enter your first name',
          labelText: 'First Name',
          suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/person.svg'),
        ),
      );
}
