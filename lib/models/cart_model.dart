import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifood_user_app/models/food_model.dart';

class CartModel extends FoodModel {
  int quantity = 0;

  CartModel({
    idRestaurant,
    idFood,
    images,
    name,
    price,
    desc,
    required this.quantity,
  }) : super(
          idRestaurant: idRestaurant,
          idFood: idFood,
          images: images,
          name: name,
          price: price,
          desc: desc,
        );
  // factory CartModel.fromJson(Map<String, dynamic> json) {
  //   final food = new FoodModel.fromJson(json);
  //   final quantity = json['quantity'];
  //   return CartModel(
  //       quantity: quantity,
  //       idRestaurant: food.idRestaurant,
  //       idFood: food.idFood,
  //       images: food.images,
  //       name: food.name,
  //       price: food.price,
  //       desc: food.desc);
  // }
  //receiving data from server
  factory CartModel.fromDocument(DocumentSnapshot doc) {
    return CartModel(
      quantity:
          doc.data().toString().contains('quantity') ? doc.get('quantity') : '',
      idRestaurant: doc.data().toString().contains('idRestaurant')
          ? doc.get('idRestaurant')
          : '',
      idFood: doc.data().toString().contains('idFood') ? doc.get('idFood') : '',
      images: doc.data().toString().contains('images') ? doc.get('images') : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      price: doc.data().toString().contains('price') ? doc.get('price') : '',
      desc: doc.data().toString().contains('desc') ? doc.get('desc') : '',
    );
  }

  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'quantity': quantity,
      'idRestaurant': idRestaurant,
      'idFood': idFood,
      'images': images,
      'name': name,
      'price': price,
      'desc': desc,
    };
  }
}
