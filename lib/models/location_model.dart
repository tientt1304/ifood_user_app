import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  String? latitude;
  String? longitude;

  LocationModel({this.latitude, this.longitude});

  //receiving data from server
  factory LocationModel.fromDocument(DocumentSnapshot doc) {
    return LocationModel(
      latitude:
          doc.data().toString().contains('latitude') ? doc.get('latitude') : '',
      longitude: doc.data().toString().contains('longitude')
          ? doc.get('longitude')
          : '',
    );
  }
  //Convert to JSON
  Map<String, dynamic> toMap() {
    return {'latitude': latitude, 'longitude': longitude};
  }
}
