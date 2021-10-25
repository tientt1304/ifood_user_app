class UserModel {
  late final String? uid;
  String? email;
  String? password;
  String? fName;
  String? lName;
  String? phoneNumber;
  String? avatar;
  UserModel(
      {this.uid,
      this.email,
      this.fName,
      this.lName,
      this.password,
      this.phoneNumber,
      this.avatar});
  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        password: map['password'],
        email: map['email'],
        fName: map['fName'],
        lName: map['lName'],
        phoneNumber: map['phoneNumber'],
        avatar: map['avatar']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'password': password,
      'email': email,
      'fName': fName,
      'lName': lName,
      'phoneNumber': phoneNumber,
      'avatar': avatar
    };
  }
}
