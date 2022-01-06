import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifood_user_app/pages/select_location/select_location_screen.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

//import 'package:location/location.dart';

import '../../../SizeConfig.dart';

class BodyUpdateLocation extends StatefulWidget {
  @override
  State<BodyUpdateLocation> createState() => _BodyUpdateLocationState();
}

class _BodyUpdateLocationState extends State<BodyUpdateLocation> {
  var current;

  // late GoogleMapController _controller;
  // Location _location = Location();
  // LatLng _initialcameraposition = LatLng(14, 107);
  // void _onMapCreated(GoogleMapController _cntlr) {
  //   _controller = _cntlr;
  //   _location.onLocationChanged.listen((l) {
  //     _controller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(target: LatLng(l.latitude!, l.longitude!)),
  //       ),
  //     );
  //   });
  // }

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
              // ButtonLocationCard(
              //   location: current == null ? 'No location selected' : current,
              //   onPress: () {
              //     setLocation();
              //   },
              // ),
              // Container(
              //   height: SizeConfig.screenHeight! * 0.5,
              //   width: SizeConfig.screenWidth! * 0.95,
              //   child: GoogleMap(
              //     onMapCreated: _onMapCreated,
              //     initialCameraPosition:
              //         CameraPosition(target: _initialcameraposition),
              //     mapType: MapType.normal,
              //     myLocationEnabled: true,
              //   ),
              // ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              MainButton(
                  title: 'Continue',
                  onPress: () {
                    Navigator.pushNamed(context, SetLocationScreen.routeName);
                    // Navigator.pushNamed(
                    //     context, RegisterSuccessScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // void setLocation() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     //Fluttertoast.showToast(msg: 'Permission not given');
  //     await Geolocator.openLocationSettings();
  //   } else {
  //     Position currentPositon = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //     setState(() {
  //       current = '(' +
  //           currentPositon.latitude.toString() +
  //           ', ' +
  //           currentPositon.longitude.toString() +
  //           ')';
  //     });
  //     FirebaseAuth _auth = FirebaseAuth.instance;
  //     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //     User? user = _auth.currentUser;
  //     UserModel userModel = UserModel();
  //     userModel.latitude = currentPositon.latitude.toString();
  //     userModel.longitude = currentPositon.longitude.toString();
  //     firebaseFirestore
  //         .collection('users')
  //         .doc(user!.uid)
  //         .update(userModel.locationToJSON());
  //   }
  // }
}
