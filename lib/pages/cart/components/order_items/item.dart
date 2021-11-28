import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    // required this.cart,
  }) : super(key: key);

  // final Cart cart;

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: splitColor,
    //       ),
    //       child: Row(
    //         children: [
    //           SizedBox(
    //             width: getProportionateScreenWidth(10),
    //           ),
    //           SizedBox(
    //             width: getProportionateScreenWidth(30),
    //             child: AspectRatio(
    //               aspectRatio: 0.5,
    //               child: Image.asset(cart.product.images),
    //             ),
    //           ),
    //           SizedBox(width: getProportionateScreenWidth(20)),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 cart.product.name,
    //                 style: TextStyle(fontWeight: FontWeight.bold),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Text.rich(
    //                 TextSpan(
    //                   text: 'Cost: ${cart.product.price} \VND',
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );
    return Container();
  }
}
