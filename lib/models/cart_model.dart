import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:ifood_user_app/models/food_model.dart';

class CartModel {
  String? idCart;
  //FoodModel? foodModel;
  String idFood;
  String idRestaurant;
  String images;
  String name;
  num price;
  num quantity;
  String status;

  CartModel(
      {this.idCart,
      this.idFood = '',
      this.idRestaurant = '',
      this.images = '',
      this.name = '',
      this.price = 0,
      //this.foodModel,
      this.quantity = 1,
      this.status = 'in-cart'});

  //receiving data from server
  factory CartModel.fromDocument(DocumentSnapshot doc) {
    return CartModel(
      idCart: doc.data().toString().contains('idCart') ? doc.get('idCart') : '',
      // foodModel: doc.data().toString().contains('foodModel.id')
      //     ? doc.get('foodModel')
      //     : '',
      idRestaurant: doc.data().toString().contains('idRestaurant')
          ? doc.get('idRestaurant')
          : '',
      idFood: doc.data().toString().contains('idFood') ? doc.get('idFood') : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      images: doc.data().toString().contains('images') ? doc.get('images') : '',
      price: doc.data().toString().contains('price') ? doc.get('price') : '',
      quantity:
          doc.data().toString().contains('quantity') ? doc.get('quantity') : 0,
      status: doc.data().toString().contains('status') ? doc.get('status') : '',
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
      'quantity': quantity,
      'status': status
    };
  }
}
