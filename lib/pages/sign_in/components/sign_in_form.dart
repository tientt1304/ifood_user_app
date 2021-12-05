import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_cart.dart';
import 'package:ifood_user_app/pages/forgot_password/forgot_password_screen.dart';
import 'package:ifood_user_app/pages/success_screens/login_success_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/custom_suffix_icon.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  CartFB cartFB = new CartFB();
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
          children: <Widget>[
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
            Row(
              children: <Widget>[
                Checkbox(
                    value: remember,
                    side: BorderSide(color: secondaryColor, width: 1),
                    activeColor: mainColor,
                    onChanged: (bool? value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                Text(
                  'Remember me',
                  style: TextStyle(color: kTextColor),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.2,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName);
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: kTextColor),
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.02,
            ),
            MainButton(
                title: 'Continue',
                onPress: () {
                  _onSignIn(_emailController.text, _passwordController.text);
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
        textInputAction: TextInputAction.done,
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
  void _onSignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  //Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName),
                  // Provider.of<CartProvider>(context, listen: false)
                  //     .listCartModel
                  //     .clear(),
                  // StreamBuilder(
                  //   stream: cartFB.collectionReference
                  //       .doc(FirebaseAuth.instance.currentUser!.email)
                  //       .collection('items')
                  //       .snapshots(),
                  //   builder: (BuildContext context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       final cartDB = snapshot.data.;
                  //       CartModel cartModel = CartModel.fromDocument(x);
                  //       Provider.of<CartProvider>(context)
                  //           .listCartModel
                  //           .add(cartModel);
                  //     }
                  //   },
                  // ),
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
}
