import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:ifood_user_app/models/user_model.dart';

class FirebaseApi extends UserModel {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

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

  Map<String, dynamic> updateProfile() {
    return {
      'fName': fName,
      'lName': lName,
      'phoneNumber': phoneNumber,
      'avatar': avatar,
    };
  }

  Map<String, dynamic> avtToJSON() {
    return {'avatar': avatar};
  }

  Map<String, dynamic> locationToJSON() {
    return {'latitude': latitude, 'longitude': longitude};
  }
}
