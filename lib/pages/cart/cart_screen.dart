import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'components/body_cart.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyCart(),
    );
  }
}
