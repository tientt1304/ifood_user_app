import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifood_user_app/models/cart_model.dart';

class CartFB {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users-cart-items');

  Future<void> add(
    String idFood,
    String name,
    String images,
    num price,
    String idRestaurant,
    num quantity,
  ) async {
    String idCart = (new DateTime.now().microsecondsSinceEpoch).toString();
    return collectionReference
        .doc(_authCurrentUser!.email)
        .collection('items')
        .doc(idCart)
        .set({
          'idFood': idFood,
          'idRestaurant': idRestaurant,
          'name': name,
          'quantity': quantity,
          'images': images,
          'price': price
        })
        .then((value) => print('completed'))
        .catchError((error) => print('fail'));
  }

  Future<void> updateQuantity(String idFood) async {
    return collectionReference
        .doc(_authCurrentUser!.email)
        .collection('items')
        .doc('id')
        .delete();
  }

  Future<void> delete(String id) async {
    return collectionReference
        .doc(_authCurrentUser!.email)
        .collection('items')
        .doc(id)
        .delete();
  }

  int _itemCount = 0;
  get itemCount => _itemCount;
  set itemCount(value) {
    _itemCount = value;
  }

  Future getList() async {
    List<CartModel> _listCartModel = [];
    await FirebaseFirestore.instance
        .collection('users-cart-items')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        CartModel cartModel = CartModel.fromDocument(element);
        _listCartModel.add(cartModel);
        // print(cartModel.idRestaurant);
      });
    });
    _itemCount = _listCartModel.length;
    print('length' + _itemCount.toString());
  }
}
