import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ifood_user_app/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    int itemCount = 0;
    _items.forEach((key, value) {
      itemCount = itemCount + value.quantity;
    });
    return itemCount;
  }

  num get totalAmount {
    num total = 0;
    _items.forEach((key, value) {
      total = total + value.quantity * value.price;
    });
    return total;
  }

  void deleteItem(String idFood) {
    _items.remove(idFood);
    notifyListeners();
  }

  void addItem(String idRestaurant, String idFood, String images, String name,
      num price) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    // var cartFB = new CartFB();
    // if(cartFB.isContainFood(idFood) == idFood){
    //   return cartFB.updateQuantity(idFood)
    // }
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
