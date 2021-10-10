import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/sign_in/sign_in_screen.dart';
import 'package:ifood_user_app/pages/walkthrough/walkthrough_screen.dart';
import 'package:ifood_user_app/routes.dart';
import 'package:ifood_user_app/theme.dart';

void main() {
  runApp(IFood());
}

class IFood extends StatelessWidget {
  const IFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iFood',
        theme: theme(),
        routes: routes,
        home: SignInScreen(),
        //initialRoute: GetStartedScreen.routeName
    );
  }
}

// GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);
//         if (!currentFocus.hasPrimaryFocus &&
//             currentFocus.focusedChild != null) {
//           FocusManager.instance.primaryFocus!.unfocus();
//         }
//       },
//       child: 