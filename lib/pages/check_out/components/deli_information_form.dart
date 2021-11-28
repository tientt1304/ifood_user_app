import 'package:flutter/material.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';

import '../../../SizeConfig.dart';

class DeliInformationForm extends StatefulWidget {
  const DeliInformationForm({Key? key}) : super(key: key);

  @override
  _DeliInformationFormState createState() => _DeliInformationFormState();
}

class _DeliInformationFormState extends State<DeliInformationForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _commentController = TextEditingController();

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
              child: buildLocationTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildNameTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildPhoneNumberTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: buildCommentTextField(),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() => TextFormField(
        //initialValue: '0345450643',
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
          labelText: 'Phone Number',
        ),
      );
  TextFormField buildNameTextField() => TextFormField(
        //initialValue: 'Tien Truong',
        controller: _nameController,
        onSaved: (value) {
          _nameController.text = value.toString();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Personal Detail',
        ),
      );
  TextFormField buildLocationTextField() => TextFormField(
        // initialValue: '(0,0)',
        controller: _locationController,
        onSaved: (value) {
          _nameController.text = value.toString();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Delivery Address',
        ),
      );
  TextFormField buildCommentTextField() => TextFormField(
        //initialValue: 'Alo 123',
        controller: _commentController,
        onSaved: (value) {
          _nameController.text = value.toString();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          labelText: 'Comment',
        ),
      );
}
