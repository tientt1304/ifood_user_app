import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final idCart;
  final String idFood;
  final String name;
  final String images;
  final num price;
  final String idRestaurant;
  final int quantity;

  CartModel({
    required this.idCart,
    required this.idRestaurant,
    required this.idFood,
    required this.images,
    required this.name,
    required this.price,
    required this.quantity,
  });

  //receiving data from server
  factory CartModel.fromDocument(DocumentSnapshot doc) {
    return CartModel(
      idCart: doc.data().toString().contains('idCart') ? doc.get('idCart') : '',
      idRestaurant: doc.data().toString().contains('idRestaurant')
          ? doc.get('idRestaurant')
          : '',
      idFood: doc.data().toString().contains('idFood') ? doc.get('idFood') : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      images: doc.data().toString().contains('images') ? doc.get('images') : '',
      price: doc.data().toString().contains('price') ? doc.get('price') : '',
      quantity:
          doc.data().toString().contains('quantity') ? doc.get('quantity') : '',
    );
  }
  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'idCart': idCart,
      'idFood': idFood,
      'name': name,
      'images': images,
      'price': price,
      'idRestaurant': idRestaurant,
      'quantity': quantity
    };
  }
}
