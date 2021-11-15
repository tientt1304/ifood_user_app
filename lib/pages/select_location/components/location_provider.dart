import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  BitmapDescriptor? _pinLocationIcon;
  Map<MarkerId, Marker>? _markers;
  Map<MarkerId, Marker> get markers => _markers!;
  final MarkerId markerId = MarkerId("1");

  GoogleMapController? _mapController;
  GoogleMapController get mapController => _mapController!;

  Location? _location;
  Location get location => _location!;
  BitmapDescriptor get pinLocationIcon => _pinLocationIcon!;

  LatLng? _locationPosition;
  LatLng get locationPosition => _locationPosition!;

  bool locationServiceActive = true;

  LocationProvider() {
    _location = new Location();
    _markers = <MarkerId, Marker>{};
  }

  initialization() async {
    await getUserLocation();
  }

  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.onLocationChanged.listen(
      (LocationData currentLocation) {
        _locationPosition = LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        );

        print(_locationPosition);
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        User? user = _auth.currentUser;
        UserModel userModel = UserModel();
        userModel.latitude = _locationPosition!.latitude.toString();
        userModel.longitude = _locationPosition!.longitude.toString();
        firebaseFirestore
            .collection('users')
            .doc(user!.uid)
            .update(userModel.locationToJSON());
        _markers!.clear();

        Marker marker = Marker(
          markerId: markerId,
          position: LatLng(
            _locationPosition!.latitude,
            _locationPosition!.longitude,
          ),
          icon: pinLocationIcon,
          draggable: true,
          onDragEnd: ((newPosition) {
            _locationPosition = LatLng(
              newPosition.latitude,
              newPosition.longitude,
            );

            notifyListeners();
          }),
        );

        _markers![markerId] = marker;

        notifyListeners();
      },
    );
  }

  setMapController(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  takeSnapshot() {
    return _mapController!.takeSnapshot();
  }
}
