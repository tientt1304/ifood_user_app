import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/cart/components/cart_delivering.dart';
import 'package:ifood_user_app/pages/cart/components/cart_history.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Orders', style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: TabBar(
            labelColor: mainColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),
            indicatorColor: mainColor,
            tabs: [
              Tab(
                text: 'Delivering',
              ),
              Tab(
                text: 'Order',
              )
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            CartDelivering(),
            CartHistory(),
          ],
        ),
        ),
    );  
  }
}