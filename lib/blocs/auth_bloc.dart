import 'dart:async';

import 'package:ifood_user_app/firebase/firebaseAuth.dart';

class AuthBloc {
  var _fbaseAuth = FbaseAuth();
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream? get emailStream => _emailController.stream;
  Stream? get passwordStream => _passwordController.stream;

  void signIn(String email, String password, Function onSuccess,
      Function(String) onError) {
    _fbaseAuth.signIn(email, password, onSuccess, onError);
  }

  bool checkSignIn(String? email, String? password) {
    if (email == null || email.length == 0) {
      _emailController.sink.addError('Enter your email');
      return false;
    }
    _emailController.sink.add('');

    if (password == null || password.length == 0) {
      _passwordController.sink.addError('Enter your password');
      return false;
    }
    _passwordController.sink.add('');

    if (password.length > 0 && password.length < 6) {
      _passwordController.sink.addError('Password must be 6 characters long');
      return false;
    }
    _passwordController.sink.add('');

    return true;
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
