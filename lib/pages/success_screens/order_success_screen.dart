import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/success_screens/components/body_order_success.dart';

class OrderSuccessScreen extends StatelessWidget {
  static String routeName = '/ordersuccess';
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyOrderSuccess(),
    );
  }
}
