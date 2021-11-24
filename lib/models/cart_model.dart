import 'package:ifood_user_app/models/food_model.dart';

class Cart {
  final FoodModel product;

  Cart({required this.product});
}

List<Cart> historyCarts = [
  Cart(product: demoProducts[0]),
  Cart(product: demoProducts[1]),
  Cart(product: demoProducts[1]),
];
List<Cart> deliveringCarts = [
  Cart(product: demoProducts[1]),
  Cart(product: demoProducts[2]),
];
