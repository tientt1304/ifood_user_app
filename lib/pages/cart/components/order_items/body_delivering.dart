import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/models/cart_model.dart';
import 'package:ifood_user_app/pages/cart/components/order_items/item.dart';

class BodyDeliveringItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
          itemCount: deliveringCarts.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                child: Column(
                  children: [
                    CartItemCard(
                      cart: deliveringCarts[index],
                    ),
                  ],
                ),
              )),
    );
  }
}
