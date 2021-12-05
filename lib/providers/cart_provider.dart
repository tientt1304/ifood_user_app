import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ifood_user_app/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _listCartModel = [];
  List<CartModel> get listCartModel => _listCartModel;
  set listCartModel(value) {
    _listCartModel = value;
    notifyListeners();
  }

  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  num _itemCountx = 0;

  get itemCountx => _itemCountx;
  set itemCountx(value) {
    _itemCountx = value;
    //notifyListeners();
  }

  void count(value) {
    _itemCountx = value;
    notifyListeners();
  }

  int get itemCount {
    int itemCount = _listCartModel.length;

    return itemCount;
  }

  // num get totalAmount {
  //   num total = 0;
  //   _items.forEach((key, value) {
  //     total = total + value.quantity * value.price;
  //   });
  //   notifyListeners();
  //   return total;
  // }

  void addItem(String idRestaurant, String idFood, String images, String name,
      num price) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    if (_items.containsKey(idFood)) {
      //change quantity
      _items.update(idFood, (existingCartModel) {
        FirebaseFirestore.instance
            .collection('users-cart-items')
            .doc(currentUser!.email)
            .collection('items')
            .doc(existingCartModel.idCart)
            .update({
          'quantity': existingCartModel.quantity + 1,
        });
        return CartModel(
            idCart: existingCartModel.idCart,
            idRestaurant: existingCartModel.idRestaurant,
            idFood: existingCartModel.idFood,
            images: existingCartModel.images,
            name: existingCartModel.name,
            price: existingCartModel.price,
            quantity: existingCartModel.quantity + 1);
      });
    } else {
      _items.putIfAbsent(idFood, () {
        var idCart = DateTime.now().toString();
        FirebaseFirestore.instance
            .collection('users-cart-items')
            .doc(currentUser!.email)
            .collection('items')
            .doc(idCart)
            .set({
          'idRestaurant': idRestaurant,
          'name': name,
          'images': images,
          'price': price,
          'idFood': idFood,
          'quantity': 1,
        }).then((value) => Fluttertoast.showToast(msg: 'Added item to cart'));
        return CartModel(
          idCart: idCart,
          idRestaurant: idRestaurant,
          idFood: idFood,
          images: images,
          name: name,
          price: price,
          quantity: 1,
        );
      });
    }
  }
}
