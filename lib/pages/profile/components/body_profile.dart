import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/pages/about/about_screen.dart';
import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/pages/help_center/helpcenter_screen.dart';
import 'package:ifood_user_app/pages/my_account/myaccount_screen.dart';
import 'package:ifood_user_app/pages/notification/notification_screen.dart';
import 'package:ifood_user_app/pages/profile/components/avatar_card.dart';
import 'package:ifood_user_app/pages/profile/components/profile_card.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  String displayName = '';
  String avtUrl = '';
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

  Future<String> getName(BuildContext context) async {
    String name = '';
    if (_auth.currentUser != null) {
      DocumentSnapshot user = await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid.toString())
          .get();
      name = user['fName'] + ' ' + user['lName'];
    }
    return name;
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
    getName(context).then((String name) {
      setState(() {
        displayName = name;
      });
    });
    getAvt(context).then((String url) {
      setState(() {
        avtUrl = url;
        image = File(avtUrl);
        print(url);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> content = [
      {
        'title': 'My Account',
        'prefixIcon':
            'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ficons%2Fuser.png?alt=media&token=83a4e894-74b4-4930-8e6b-ac78c057b10b',
        'onPress': () {
          Navigator.pushNamed(context, MyAccountScreen.routeName);
        }
      },
      {
        'title': 'Notifications',
        'prefixIcon':
            'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ficons%2Fnoti.png?alt=media&token=528f96b6-057b-495b-8a8b-13eef9c702d8',
        'onPress': () {
          Navigator.pushNamed(context, NotificationScreen.routeName);
        }
      },
      {
        'title': 'Help Center',
        'prefixIcon':
            'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ficons%2Fquestion_mark_icon.png?alt=media&token=36976323-0a31-4a91-b51f-ae5e30356cfc',
        'onPress': () {
          Navigator.pushNamed(context, HelpCenterScreen.routeName);
        }
      },
      {
        'title': 'About',
        'prefixIcon':
            'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ficons%2Fabout_icon.png?alt=media&token=397018f0-2e31-4977-8323-a17ff4870283',
        'onPress': () {
          Navigator.pushNamed(context, AboutScreen.routeName);
        }
      },
      {
        'title': 'Log Out',
        'prefixIcon':
            'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ficons%2Flogout.png?alt=media&token=6be48dd0-fa29-40f8-a1c2-3c581e285a13',
        'onPress': () {
          Navigator.pushNamedAndRemoveUntil(
              context, GetStartedScreen.routeName, (route) => false);
        }
      }
    ];
    Future<void> _refreshList() async {
      //getBills(billNotifier);
      getName(context).then((String name) {
        setState(() {
          displayName = name;
        });
      });
    }

    return RefreshIndicator(
      onRefresh: _refreshList,
      color: primaryColor,
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.015,
          ),
          (image != null)
              ? AvatarCard(
                  image: image!, onClicked: (source) => pickImage(source))
              : AvatarCard(
                  image: File(
                      'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Fpng-clipart-computer-icons-user-profile-avatar-profile-heroes-profile-thumbnail.png?alt=media&token=9cb56cba-05d4-4a30-8c1b-fbdd2bf82396'),
                  onClicked: (source) => pickImage(source)),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          Text(
            displayName,
            style: TextStyle(
                color: kTextColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.8,
            child: ListView.builder(
                itemCount: content.length,
                itemBuilder: (context, index) {
                  return ProfileCard(
                    onPress: content[index]['onPress'],
                    title: content[index]['title'],
                    prefixIcon: content[index]['prefixIcon'],
                  );
                }),
          ),
        ],
      )),
    );
  }
}
