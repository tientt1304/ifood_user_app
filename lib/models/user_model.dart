import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? fName;
  String? lName;
  String? phoneNumber;
  String? avatar;
  String? latitude;
  String? longitude;

  UserModel(
      {this.uid,
      this.email,
      this.fName,
      this.lName,
      this.phoneNumber,
      this.avatar,
      this.latitude,
      this.longitude});

  //receiving data from server
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      uid: doc.data().toString().contains('uid') ? doc.get('uid') : '',
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      fName: doc.data().toString().contains('fName') ? doc.get('fName') : '',
      lName: doc.data().toString().contains('lName') ? doc.get('lName') : '',
      phoneNumber: doc.data().toString().contains('phoneNumber')
          ? doc.get('phoneNumber')
          : '',
      avatar: doc.data().toString().contains('avatar') ? doc.get('avatar') : '',
      latitude:
          doc.data().toString().contains('latitude') ? doc.get('latitude') : '',
      longitude: doc.data().toString().contains('longitude')
          ? doc.get('longitude')
          : '',
    );
  }
  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'email': email,
      'fName': fName,
      'lName': lName,
      'phoneNumber': phoneNumber,
      'avatar': avatar,
      'latitude': latitude,
      'longitude': longitude
    };
  }

  Map<String, dynamic> avtToJSON() {
    return {'avatar': avatar};
  }

  Map<String, dynamic> locationToJSON() {
    return {'latitude': latitude, 'longitude': longitude};
  }
}
