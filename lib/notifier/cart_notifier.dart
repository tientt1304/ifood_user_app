import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:ifood_user_app/models/cart_model.dart';

class CartNotifier with ChangeNotifier {
  List<CartModel> _cart = [];
  CartModel? _currentCart;
  UnmodifiableListView<CartModel> get cart => UnmodifiableListView(_cart);

  CartModel get currentCart => _currentCart!;

  set cartList(List<CartModel> cart) {
    _cart = cart;
    notifyListeners();
  }

  set currentCart(CartModel cartModel) {
    _currentCart = cartModel;
    notifyListeners();
  }

  addToCart(CartModel cartModel) {
    bool isExist = false;
    _cart.forEach((item) {
      if (item.idFood == cartModel.idFood) isExist = true;
    });
    if (isExist == true) {
      //change quantity
      _cart[_cart.indexWhere((_cart) => _cart.idFood == cartModel.idFood)]
          .quantity++;
    } else {
      _cart.insert(0, cartModel);
    }
    notifyListeners();
  }

  deleteCart(CartModel cartModel) {
    _cart.removeWhere((_cart) => _cart.idFood == cartModel.idFood);
    notifyListeners();
  }
}
