import 'package:flutter/material.dart';

import 'package:ifood_user_app/pages/shopping_cart/components/body_shopping_cart.dart';

class ShoppingCartScreen extends StatelessWidget {
  static String routeName = '/shoppingcart';
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyShoppingCart());
  }
}
