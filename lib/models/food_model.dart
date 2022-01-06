import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  String idFood;
  String name;
  String desc;
  String images;
  num price;
  String idRestaurant;
  num? ratingFood;

  FoodModel(
      {this.idRestaurant = '',
      this.idFood = '',
      this.images = '',
      this.name = '',
      this.price = 0,
      this.desc = '',
      this.ratingFood});

  //receiving data from server
  factory FoodModel.fromDocument(DocumentSnapshot doc) {
    return FoodModel(
      idRestaurant: doc.data().toString().contains('idRestaurant')
          ? doc.get('idRestaurant')
          : '',
      idFood: doc.data().toString().contains('idFood') ? doc.get('idFood') : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      desc: doc.data().toString().contains('desc') ? doc.get('desc') : '',
      images: doc.data().toString().contains('images') ? doc.get('images') : '',
      price: doc.data().toString().contains('price') ? doc.get('price') : 0,
      ratingFood: doc.data().toString().contains('ratingFood')
          ? doc.get('ratingFood')
          : '',
    );
  }
  //Convert to JSON
  Map<String, dynamic> toMap() {
    return {
      'idFood': idFood,
      'name': name,
      'desc': desc,
      'images': images,
      'price': price,
      'idRestaurant': idRestaurant,
      'ratingFood': ratingFood
    };
  }
}
