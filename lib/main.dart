import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/notifier/bill_notifier.dart';
import 'package:ifood_user_app/notifier/cart_notifier.dart';
import 'package:ifood_user_app/notifier/notification_notifier.dart';
import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/routes.dart';
import 'package:ifood_user_app/theme.dart';
import 'package:provider/provider.dart';

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
          ChangeNotifierProvider(
            create: (context) => CartNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => BillNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => NotificationNotifier(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iFood',
          theme: theme(),
          routes: routes,
          initialRoute: GetStartedScreen.routeName,
          //initialRoute: WalkthroughScreen.routeName,
        ));
  }
}
