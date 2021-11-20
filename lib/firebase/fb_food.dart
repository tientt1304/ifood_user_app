import 'package:cloud_firestore/cloud_firestore.dart';

class FoodFB {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('foods');

  Future<void> add(
    String idFood,
    String idRestaurant,
    String title,
    String desc,
    String images,
    num price,
  ) async {
    String idFood = (new DateTime.now().microsecondsSinceEpoch).toString();
    return FirebaseFirestore.instance
        .collection("foods")
        .doc(idFood)
        .set({
          'idFood': idFood,
          'idRestaurant': idRestaurant,
          'title': title,
          'desc': desc,
          'images': images,
          'price': price
        })
        .then((value) => print('completed'))
        .catchError((error) => print('fail'));
  }

  Future<void> delete(String id) async {
    return FirebaseFirestore.instance.collection("foods").doc(id).delete();
  }
}
