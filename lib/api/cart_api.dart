import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifood_user_app/models/cart_model.dart';
import 'package:ifood_user_app/notifier/cart_notifier.dart';

getCarts(CartNotifier cartNotifier) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('users-cart-items')
      .doc(_authCurrentUser!.email)
      .collection('items')
      .get();
  List<CartModel> _cartList = [];
  querySnapshot.docs.forEach((doc) {
    CartModel cartModel = CartModel.fromDocument(doc);
    _cartList.add(cartModel);
  });

  cartNotifier.cartList = _cartList;
}

addToCart(
    CartModel cartModel, Function cartAdded, CartNotifier cartNotifier) async {
  await getCarts(cartNotifier);
  bool isExist = false;
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  cartNotifier.cart.forEach((item) {
    if (item.idFood == cartModel.idFood) isExist = true;
  });
  if (isExist == true) {
    //change quantity
    print('Existed');
    num _currentQuantity = 0;
    _currentQuantity = cartModel.quantity + 1;
    print(_currentQuantity.toString());
    await FirebaseFirestore.instance
        .collection('users-cart-items')
        .doc(_authCurrentUser!.email)
        .collection('items')
        .doc(cartModel.idFood)
        .update({
      'quantity': _currentQuantity,
    });
  } else {
    String idCart = (new DateTime.now().microsecondsSinceEpoch).toString();
    await FirebaseFirestore.instance
        .collection('users-cart-items')
        .doc(_authCurrentUser!.email)
        .collection('items')
        .doc(cartModel.idFood)
        .set({
      'idCart': idCart,
      'idFood': cartModel.idFood,
      'idRestaurant': cartModel.idRestaurant,
      'name': cartModel.name,
      'quantity': 1,
      'images': cartModel.images,
      'price': cartModel.price
    });
    print('Added New item');
  }
  cartAdded(cartModel);
}

deleteCart(CartModel cartModel, Function cartDeleted) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection('users-cart-items')
      .doc(_authCurrentUser!.email)
      .collection('items')
      .doc(cartModel.idFood)
      .delete();
  cartDeleted(cartModel);
}
