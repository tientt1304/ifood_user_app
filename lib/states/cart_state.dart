import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/models/cart_model.dart';
import 'package:ifood_user_app/models/food_model.dart';

class CartStateController extends GetxController {
  var cart = List<CartModel>.empty(growable: true).obs;
  final box = GetStorage();

  addToCart(FoodModel foodModel, {int quantity: 1}) async {
    try {
      var cartItem = CartModel(
        idRestaurant: foodModel.idRestaurant,
        idFood: foodModel.idFood,
        images: foodModel.images,
        name: foodModel.name,
        desc: foodModel.desc,
        price: foodModel.price,
        quantity: 1,
      );
      if (isExists(cartItem)) {
        //if cart item already available in cart, update quantity
        var foodNeedToUpdate =
            cart.firstWhere((element) => element.idFood == cartItem.idFood);
        foodNeedToUpdate.quantity += quantity;
      } else {
        cart.add(cartItem);
      }
      //After update in4, will save to storage
      var jsonDBEncode = jsonEncode(cart);
      await box.write(MY_CART_KEY, jsonDBEncode);
      cart.refresh();
      Get.snackbar('Add cart success', 'Your cart has been updated');
    } catch (e) {
      Get.snackbar('Add cart error', e.toString());
    }
  }

  bool isExists(CartModel cartItem) {
    return cart.contains(cartItem);
  }

  sumCart() {
    return cart.length == 0
        ? 0
        : cart
            .map((e) => e.price * e.quantity)
            .reduce((value, element) => value + element);
  }

  getQuantity() {
    return cart.length == 0
        ? 0
        : cart
            .map((e) => e.quantity)
            .reduce((value, element) => value + element);
  }

  getShippingFee() => sumCart() * 0.1; // 10% total value
}
