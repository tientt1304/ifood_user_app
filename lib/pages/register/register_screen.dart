import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/sign_in/sign_in_screen.dart';
import 'package:ifood_user_app/pages/updateProfile/update_profile_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';
import '../../constants.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final _phoneNumberController = new TextEditingController();
  final _otpController = new TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;

  bool showLoading = false;

  void signUpWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = true;
      });
      if (authCredential.user != null) {
        Navigator.pushNamed(context, UpdateProfileScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight! * 0.01,
            horizontal: SizeConfig.screenWidth! * 0.06,
          ),
          child: buildPhoneNumberTextField(),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.04,
        ),
        MainButton(
            title: 'Continue',
            onPress: () async {
              setState(() {
                showLoading = false;
              });

              await _auth.verifyPhoneNumber(
                phoneNumber: _phoneNumberController.text,
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    setState(() {
                      showLoading = false;
                    });
                  });
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  Fluttertoast.showToast(msg: verificationFailed.message!);
                },
                codeSent: (verificationId, resendingToken) async {
                  setState(() {
                    showLoading = false;
                    currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                    this.verificationId = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) async {},
              );
            })
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight! * 0.01,
            horizontal: SizeConfig.screenWidth! * 0.06,
          ),
          child: TextFormField(
              controller: _otpController,
              onChanged: (value) async {
                print(value);
              },
              onSaved: (value) {
                _otpController.text = value!;
              },
              textAlign: TextAlign.center,
              style: TextStyle(letterSpacing: 30, fontSize: 18),
              maxLength: 6,
              keyboardType: TextInputType.number),
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.05),
        MainButton(
            title: 'Continue',
            onPress: () async {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: _otpController.text);
              signUpWithPhoneAuthCredential(phoneAuthCredential);
            }),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.2,
        ),
        GestureDetector(
            onTap: () {},
            child: Text(
              "Resend OTP Code",
              style: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          iconSize: 21,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Sign Up',
            style: TextStyle(
                color: kTitleColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'FSSemiBold')),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleContent(
                  title: 'Register with Phone Number',
                  content:
                      'Your number will safe with us. \nWe won’t share your details with anyone.',
                ),
                Container(
                    child: showLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : currentState ==
                                MobileVerificationState.SHOW_MOBILE_FORM_STATE
                            ? getMobileFormWidget(context)
                            : getOtpFormWidget(context)),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName);
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 16,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() => TextFormField(
        onSaved: (value) {
          _phoneNumberController.text = value!;
        },
        controller: _phoneNumberController,
        validator: (value) {
          if (value != null && !phoneNumberValidatorRegExp.hasMatch(value)) {
            return kInvalidPhoneNummberError;
          } else if (value == null || value.isEmpty) {
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
}
