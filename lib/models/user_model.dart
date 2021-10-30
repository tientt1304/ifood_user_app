class UserModel {
  String? uid;
  String? fName;
  String? lName;
  String? phoneNumber;
  String? avatar;
  String? latitude;
  String? longitude;
  UserModel(
      {this.uid,
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
