import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/cart/components/order_items/body_delivering.dart';



class CartDelivering extends StatefulWidget {
  @override
  _CartDelivering createState() => _CartDelivering();
}

class _CartDelivering extends State<CartDelivering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDeliveringItems(),
    );
  }
}
