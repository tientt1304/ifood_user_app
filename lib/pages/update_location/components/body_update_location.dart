import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/pages/success_screens/register_success_screen.dart';
import 'package:ifood_user_app/pages/update_location/components/button_location_card.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';
import 'package:geolocator/geolocator.dart';

import '../../../SizeConfig.dart';

class BodyUpdateLocation extends StatefulWidget {
  @override
  State<BodyUpdateLocation> createState() => _BodyUpdateLocationState();
}

class _BodyUpdateLocationState extends State<BodyUpdateLocation> {
  var current;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                  title: 'Set Your Location',
                  content:
                      'This data will be displayed \nin your account profile for security'),
              Column(
                children: [
                  ButtonLocationCard(
                    location:
                        current == null ? 'No location selected' : current,
                    onPress: () {
                      setLocation();
                      // Navigator.pushNamed(context, SetLocationScreen.routeName);
                    },
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.25,
              ),
              MainButton(
                  title: 'Continue',
                  onPress: () {
                    Navigator.pushNamed(
                        context, RegisterSuccessScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void setLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      //Fluttertoast.showToast(msg: 'Permission not given');
      await Geolocator.openLocationSettings();
    } else {
      Position currentPositon = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        current = '(' +
            currentPositon.latitude.toString() +
            ', ' +
            currentPositon.longitude.toString() +
            ')';
      });
      FirebaseAuth _auth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      UserModel userModel = UserModel();
      userModel.latitude = currentPositon.latitude.toString();
      userModel.longitude = currentPositon.longitude.toString();
      firebaseFirestore
          .collection('users')
          .doc(user!.uid)
          .update(userModel.locationToJSON());
    }
  }
}
