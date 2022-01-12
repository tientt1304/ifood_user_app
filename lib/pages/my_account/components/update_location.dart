import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/my_account/myaccount_screen.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

class UpdateLocation extends StatefulWidget {
  static String routeName = '/updateaddress';
  const UpdateLocation({Key? key}) : super(key: key);
  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  String? latitude;
  String? longitude;
  String? address;

  bool _isload = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    Position position = await _determinePosition();
    print(position.longitude);
    print(position.latitude);
    setState(() {
      longitude = position.longitude.toString();
      latitude = position.latitude.toString();
    });
    getAddressFromLatLong(position);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    String newAddress = place.locality.toString() +
        place.street.toString() +
        ', ' +
        place.subAdministrativeArea.toString() +
        ", " +
        place.administrativeArea.toString();
    setState(() {
      address = newAddress;
      _isload = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleContent(
                title: 'Set Your Location',
                content:
                    'This data will be displayed \nin your account profile for security'),
            _isload == true
                ? Center(
                    child: Container(
                      height: size.height / 20,
                      width: size.height / 20,
                      child: CircularProgressIndicator(color: primaryColor),
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        Text(
                          address!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: load,
                          child: Text(
                            "Update Location",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(primary: Colors.black),
                        )
                      ],
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            MainButton(
                title: "Save",
                onPress: () {
                  onClick();
                })
          ],
        ),
      ),
    );
  }

  void onClick() async {
    CircularProgressIndicator(
      color: primaryColor,
      semanticsLabel: 'Saving...',
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "address": address,
      "longitude": longitude,
      "latitude": latitude,
    }).then((value) => {
              Navigator.pushReplacementNamed(
                  context, MyAccountScreen.routeName),
            });
  }
}
