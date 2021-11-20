import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

class MyAccountForm extends StatefulWidget {
  MyAccountForm({Key? key}) : super(key: key);

  @override
  _MyAccountFormState createState() => _MyAccountFormState();
}

class _MyAccountFormState extends State<MyAccountForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController(text: 'u1@gmail.com');
  final _passwordController = TextEditingController(text: '********');
  final _confirmPasswordController = TextEditingController(text: '********');
  final _fNameController = TextEditingController(text:'Ho');
  final _lNameController = TextEditingController(text: 'Tu');
  final _phoneNumberController = TextEditingController(text: '0327024743');

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
              child: buildEmailTextField(),
            ),
             Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPhoneNumberTextField(),
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
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
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
      ),
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
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
      decoration: const InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/lock.svg'),
      ),
    );
  }

  TextFormField buildConfirmPasswordTextField() {
    return TextFormField(
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
      decoration: const InputDecoration(
        hintText: 'Re-enter your password',
        labelText: 'Password',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/lock.svg'),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() {
    return TextFormField(
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
  }

  TextFormField buildLastNameTextField() {
    return TextFormField(
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
  }

  TextFormField buildFirstNameTextField() {
    return TextFormField(
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
  }
}
