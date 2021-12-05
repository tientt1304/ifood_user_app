import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';
import '../../../SizeConfig.dart';

class MyAccountForm extends StatefulWidget {
  const MyAccountForm({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final uid;

  @override
  _MyAccountFormState createState() => _MyAccountFormState();
}

class _MyAccountFormState extends State<MyAccountForm> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isLoading = false;
  UserModel userModel = new UserModel();
  // bool _nameValid = true;
  // bool _phoneValid = true;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get();
    userModel = UserModel.fromDocument(doc);
    fNameController.text = userModel.fName!;
    lNameController.text = userModel.lName!;
    phoneNumberController.text = userModel.phoneNumber!;
    print('3' + userModel.fName!);
    setState(() {
      isLoading = false;
    });
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
            onPress: () {},
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() => TextFormField(
        onChanged: (value) {
          phoneNumberController.text = value;
        },
        controller: phoneNumberController,
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
          hintText: '',
          suffixIcon:
              CustomSuffixIcon(svgIconSrc: 'assets/icons/phone_android.svg'),
        ),
      );
  TextFormField buildLastNameTextField() => TextFormField(
        controller: lNameController,
        onChanged: (value) {
          lNameController.text = value.toString();
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
        controller: fNameController,
        onChanged: (value) {
          fNameController.text = value.toString();
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
