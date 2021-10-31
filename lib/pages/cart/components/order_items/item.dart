import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/models/cart.dart';

class CartItemCard extends StatelessWidget {

const CartItemCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(88),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Image.asset(cart.product.images[0]),
                ),
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.product.title,
                style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(TextSpan(
                    text: 'Cost: \$${cart.product.price}',
                    ),),
              ],
            )
          ],
        ),
      ],
    );
  }
}
