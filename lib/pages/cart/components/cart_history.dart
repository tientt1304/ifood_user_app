import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/cart/components/order_items/body_history.dart';

class CartHistory extends StatefulWidget {
  @override
  _CartHistory createState() => _CartHistory();
}

class _CartHistory extends State<CartHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyHistoryItems(),
    );
  }
}
