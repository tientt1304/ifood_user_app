import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/pages/forgot_password/components/forgot_password_form.dart';
import 'package:ifood_user_app/pages/my_account/components/avt_card.dart';
import 'package:ifood_user_app/pages/my_account/components/myaccount_form.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';
import 'package:image_picker/image_picker.dart';

class BodyMyAccount extends StatefulWidget {
  const BodyMyAccount({Key? key}) : super(key: key);

  @override
  State<BodyMyAccount> createState() => _BodyMyAccountState();
}

class _BodyMyAccountState extends State<BodyMyAccount> {
  String avtUrl = '';
  String uid = '';
  UserModel userModel = new UserModel();
  File? image;
  UploadTask? task;
  final _auth = FirebaseAuth.instance;
  UserModel? user;

  Future pickImage(ImageSource imageSoure) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSoure);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<String> getUid(BuildContext context) async {
    String uid = '';
    if (_auth.currentUser != null) {
      uid = _auth.currentUser!.uid;
    }
    return uid;
  }

  Future<UserModel> getUserModel(BuildContext context) async {
    //UserModel model = new UserModel();
    var uid = await getUid(context);
    if (_auth.currentUser != null) {
      var doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      userModel = UserModel.fromDocument(doc);
    }
    return userModel;
  }

  Future<String> getAvt(BuildContext context) async {
    String url = '';
    if (_auth.currentUser != null) {
      DocumentSnapshot user = await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid.toString())
          .get();
      url = user['avatar'];
    }
    return url;
  }

  @override
  void initState() {
    super.initState();
    getAvt(context).then((String url) {
      setState(() {
        avtUrl = url;
        image = File(avtUrl);
      });
    });
    getUid(context).then((value) {
      uid = value;
    });
    getUserModel(context);
    print('2' + userModel.email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.015),
          (image != null)
              ? AvtCard(image: image!, onClicked: (source) => pickImage(source))
              : AvtCard(
                  image: File(
                      'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Fpng-clipart-computer-icons-user-profile-avatar-profile-heroes-profile-thumbnail.png?alt=media&token=9cb56cba-05d4-4a30-8c1b-fbdd2bf82396'),
                  onClicked: (source) => pickImage(source)),
          Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.02),
              child: userModel.fName != null
                  ? MyAccountForm(uid, userModel)
                  : Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    )),
          MainButton(title: 'Change Password', onPress: openAlertForgetPassword)
        ],
      ),
    );
  }

  openAlertForgetPassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TitleContent(
                      title: 'Forgot Password',
                      content:
                          'Please enter your email and we will send you a link to return to your account'),
                  ForgotPasswordForm(),
                ],
              ),
            ),
          );
        });
  }
}
