class UserModel {
  String? uid;
  String? fName;
  String? lName;
  String? phoneNumber;
  String? avatar;
  UserModel({this.uid, this.fName, this.lName, this.phoneNumber, this.avatar});
  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        fName: map['fName'],
        lName: map['lName'],
        phoneNumber: map['phoneNumber'],
        avatar: map['avatar']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fName': fName,
      'lName': lName,
      'phoneNumber': phoneNumber,
      'avatar': avatar
    };
  }

  Map<String, dynamic> avtToMap() {
    return {'avatar': avatar};
  }
}
