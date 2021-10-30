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
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        fName: map['fName'],
        lName: map['lName'],
        phoneNumber: map['phoneNumber'],
        avatar: map['avatar'],
        latitude: map['latitude'],
        longitude: map['longitude']);
  }
  Map<String, dynamic> toMap() {
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

  Map<String, dynamic> avtToMap() {
    return {'avatar': avatar};
  }

  Map<dynamic, dynamic> locationToMap() {
    return {'latitude': latitude, 'longitude': longitude};
  }
}
