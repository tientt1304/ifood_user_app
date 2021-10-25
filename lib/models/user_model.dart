class UserModel {
  String? uid;
  String? email;
  String? fName;
  String? lName;
  String? phoneNumber;
  String? avatar;
  UserModel(
      {this.uid,
      this.email,
      this.fName,
      this.lName,
      this.phoneNumber,
      this.avatar});
  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        fName: map['fName'],
        lName: map['lName'],
        phoneNumber: map['phoneNumber'],
        avatar: map['avatar']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fName': fName,
      'lName': lName,
      'phoneNumber': phoneNumber,
      'avatar': avatar
    };
  }
}
