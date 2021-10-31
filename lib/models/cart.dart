import 'package:ifood_user_app/models/product.dart';

class Cart {
  final Product product;
  

  Cart({required this.product});
}

List<Cart> historyCarts = [
  Cart(product: demoProducts[0]),
  Cart(product: demoProducts[2]),
  Cart(product: demoProducts[3]),
];
List<Cart> deliveringCarts = [
  Cart(product: demoProducts[1]),
  Cart(product: demoProducts[3]),
];