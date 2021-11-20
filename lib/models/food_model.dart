import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  final String idFood;
  final String name;
  final String desc;
  final String images;
  final num price;
  final String idRestaurant;

  FoodModel({
    required this.idRestaurant,
    required this.idFood,
    required this.images,
    required this.name,
    required this.price,
    required this.desc,
  });

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
      price: doc.data().toString().contains('price') ? doc.get('price') : '',
    );
  }
  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'idFood': idFood,
      'name': name,
      'desc': desc,
      'images': images,
      'price': price,
      'idRestaurant': idRestaurant,
    };
  }
}

// Our demo Products

List<FoodModel> demoProducts = [
  FoodModel(
      idFood: '1',
      images: 'assets/images/drinks.png',
      name: 'Food 1',
      price: 64000,
      desc: description,
      idRestaurant: '1'),
  FoodModel(
      idFood: '2',
      images: 'assets/images/beer.png',
      name: 'Food 2',
      price: 50000,
      desc: description,
      idRestaurant: '1'),
  FoodModel(
      idFood: '3',
      images: 'assets/images/drinks.png',
      name: 'Tra sua tran chau duong den',
      price: 36000,
      desc: description,
      idRestaurant: '2'),
];

const String description =
    'Vị béo của sữa quyện với vị thơm của đường đen và vị ngọt bùi của trân châu...';
