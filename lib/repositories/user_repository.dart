import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  late final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _firebaseAuth
      ..signInWithEmailAndPassword(email: email.trim(), password: password);
  }
}
