import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // Future<CartModel> isContainFood(String idFood) async {
  //   var data = collectionReference
  //       .doc(_authCurrentUser!.email)
  //       .collection('items')
  //       .where('idFood', isEqualTo: idFood)
  //       .snapshots();
  //   //CartModel cartModel = CartModel.fromDocument(data);
  //   if (data != null) {
  //     return ;
  //   } else {
  //     return '';
  //   }
  // }
}
