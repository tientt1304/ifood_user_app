import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/pages/walkthrough/walkthrough_screen.dart';
import 'package:ifood_user_app/routes.dart';
import 'package:ifood_user_app/theme.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: CartProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iFood',
          theme: theme(),
          routes: routes,
          //initialRoute: GetStartedScreen.routeName,
          initialRoute: WalkthroughScreen.routeName,
        ));
  }
}
