import 'package:flutter/material.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  bool remember = false;
  
  final List<String> errors = [];
  
  void addError({String? error}){
    if(!errors.contains(error)){
      setState((){
        errors.add(error!);
      });
    }
  }
  void removeError({String? error}){
    if(errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextField(),
        ],
      ),
    );
  }

  TextFormField buildEmailTextField() => TextFormField(
    onSaved: (newValue) => password = newValue,
    onChanged:  (value){
      if(value.isNotEmpty && errors.contains(kPassNullError)){
        removeError(error: kPassNullError);
      } else if(value.length >=8 && errors.contains(kShortPassError)){
        removeError(error: kShortPassError);
      }
    },
    validator: (value){

    },
  );
}