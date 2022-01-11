import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/models/cart_model.dart';

class CartNotifier with ChangeNotifier {
  List<CartModel> _carts = [];
  CartModel? _currentCart;
  UnmodifiableListView<CartModel> get carts => UnmodifiableListView(_carts);

  CartModel get currentCart => _currentCart!;

  set cartList(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  set currentCart(CartModel cartModel) {
    _currentCart = cartModel;
    notifyListeners();
  }

  addToCart(CartModel cartModel) {
    bool isExist = false;
    _carts.forEach((item) {
      if (item.idFood == cartModel.idFood) isExist = true;
    });
    if (isExist == true) {
      //change quantity
      _carts[_carts.indexWhere((_cart) => _cart.idFood == cartModel.idFood)]
          .quantity++;
    } else {
      _carts.insert(0, cartModel);
    }
    notifyListeners();
  }

  deleteCart(CartModel cartModel) {
    _carts.removeWhere((_cart) => _cart.idFood == cartModel.idFood);
    notifyListeners();
  }

  countItems() {
    num count = 0;
    _carts.forEach((cart) {
      count += cart.quantity;
    });
    // notifyListeners();
    return count;
  }

  total() {
    num total = 0;
    _carts.forEach((cart) {
      total += cart.quantity * cart.price;
    });
    // notifyListeners();
    return total;
  }
}
