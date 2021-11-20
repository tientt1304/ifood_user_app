import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantFB {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('restaurants');

  Future<void> add(
      String idRestaurant,
      String name,
      double? rating,
      String logo,
      String? address,
      String? coverPicture,
      String? description,
      String? phoneNumber,
      String? latitude,
      String? longitude) async {
    String idRestaurant =
        (new DateTime.now().microsecondsSinceEpoch).toString();
    return FirebaseFirestore.instance
        .collection("restaurants")
        .doc(idRestaurant)
        .set({
          'idRestaurant': idRestaurant,
          'name': name,
          'rating': rating,
          'logo': logo,
          'address': address,
          'coverPicture': coverPicture,
          'description': description,
          'phoneNumber': phoneNumber,
          'latitude': latitude,
          'longitude': longitude
        })
        .then((value) => print('completed'))
        .catchError((error) => print('fail'));
  }

  Future<void> delete(String id) async {
    return FirebaseFirestore.instance
        .collection("restaurants")
        .doc(id)
        .delete();
  }
}
