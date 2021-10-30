import 'package:firebase_auth/firebase_auth.dart';

class FbaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    await this._firebaseAuth.sendPasswordResetEmail(email: email);
  }

  bool updatePassword(String password) {
    bool result = true;
    this._firebaseAuth.currentUser!.updatePassword(password).then((_) {
      print("Successfully changed password");
      result = true;
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      result = false;
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
    return result;
  }

  void signIn(String email, String password, Function onSuccess,
      Function(String) onSignInError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      print("err: " + err.toString());
      onSignInError("Email or password is incorrect, please try again later");
    });
  }
}
