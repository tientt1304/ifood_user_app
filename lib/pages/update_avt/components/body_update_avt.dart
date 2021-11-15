import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/firebase/firebase_api.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/pages/update_avt/components/button_card.dart';
import 'package:ifood_user_app/pages/update_avt/components/image_widget.dart';
import 'package:ifood_user_app/pages/update_location/update_location_screen.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class BodyUpdateAvt extends StatefulWidget {
  const BodyUpdateAvt({Key? key}) : super(key: key);

  @override
  _BodyUpdateAvtState createState() => _BodyUpdateAvtState();
}

class _BodyUpdateAvtState extends State<BodyUpdateAvt> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UploadTask? task;
  File? image;
  String? err;
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

  @override
  Widget build(BuildContext context) {
    final imageName =
        image != null ? basename(image!.path) : 'No image selected';
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                  title: 'Update Photo',
                  content:
                      'This data will be displayed \nin your account profile for security'),
              (image != null)
                  ? ImageWidget(
                      image: image!, onClicked: (source) => pickImage(source))
                  : Column(
                      children: [
                        ButtonCard(
                          img: 'assets/images/Gallery.svg',
                          text: 'From Gallery',
                          onPress: () => pickImage(ImageSource.gallery),
                        ),
                        ButtonCard(
                          img: 'assets/images/camera.svg',
                          text: 'Take Photo',
                          onPress: () => pickImage(ImageSource.camera),
                        ),
                      ],
                    ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.1,
              ),
              Text(imageName),
              MainButton(
                  title: 'Continue', onPress: () => uploadImage(context)),
            ],
          ),
        ),
      ),
    );
  }

  Future uploadImage(BuildContext context) async {
    if (image == null) return;

    final fileName = basename(image!.path);
    final destination = 'avatar/$fileName';

    task = FirebaseApi.uploadFile(destination, image!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download link: $urlDownload');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.avatar = urlDownload;

    await firebaseFirestore
        .collection('users')
        .doc(user!.uid)
        .update(userModel.avtToJSON());
    Navigator.pushNamed(context, UpdateLocationScreen.routeName);
  }
}
