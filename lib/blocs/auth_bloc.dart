import 'dart:async';

import 'package:ifood_user_app/firebase/firebaseAuth.dart';

class AuthBloc {
  var _fbaseAuth = FbaseAuth();
  StreamController _phoneNumberController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream? get phoneNumberStream => _phoneNumberController.stream;
  Stream? get passwordStream => _passwordController.stream;

  void signIn(String phoneNumber, String password, Function onSuccess,
      Function(String) onError) {
    _fbaseAuth.signIn(phoneNumber, password, onSuccess, onError);
  }

  bool checkSignIn(String? phoneNumber, String? password) {
    if (phoneNumber == null || phoneNumber.length == 0) {
      _phoneNumberController.sink.addError('Enter your phone number');
      return false;
    }
    _phoneNumberController.sink.add('');

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
    _phoneNumberController.close();
    _passwordController.close();
  }
}
