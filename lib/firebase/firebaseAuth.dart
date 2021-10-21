import 'package:firebase_auth/firebase_auth.dart';

class FbaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> resetPassword(String email) async {
    await this._firebaseAuth.sendPasswordResetEmail(email: email);
  }

  void signIn(String email, String password, Function onSuccess,
      Function(String) onSignInError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      print("err: " + err.toString());
      onSignInError(
          "Email hoặc mật khẩu không chính xác, vui lòng thử lại sau.");
    });
  }
}
