import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/routes.dart';
import 'package:ifood_user_app/theme.dart';

import 'pages/get_started/get_started_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(IFood());
}

class IFood extends StatefulWidget {
  const IFood({Key? key}) : super(key: key);

  @override
  _IFoodState createState() => _IFoodState();
}

class _IFoodState extends State<IFood> {
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarining = difference >= Duration(seconds: 2);
          timeBackPressed = DateTime.now();
          if (isExitWarining) {
            final message = 'Press back again to exit';
            Fluttertoast.showToast(msg: message, fontSize: 14);
            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iFood',
          theme: theme(),
          routes: routes,
          //home: UpdateAvtScreen()
          initialRoute: GetStartedScreen.routeName,
        ),
      );
}
