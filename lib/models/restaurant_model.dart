import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  String idRestaurant;
  String name;
  double? rating;
  String logo;
  String coverPicture;
  String? phoneNumber;
  String? description;
  String? address;
  String? latitude;
  String? longitude;
  double? distance;
  int? time;

  RestaurantModel(
      {required this.idRestaurant,
      required this.name,
      this.rating,
      required this.logo,
      required this.coverPicture,
      this.phoneNumber,
      this.description,
      this.address,
      this.latitude,
      this.longitude,
      this.distance});

  //receiving data from server
  factory RestaurantModel.fromDocument(DocumentSnapshot doc) {
    return RestaurantModel(
      idRestaurant: doc.data().toString().contains('idRestaurant')
          ? doc.get('idRestaurant')
          : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      rating: doc.data().toString().contains('rating') ? doc.get('rating') : '',
      logo: doc.data().toString().contains('logo') ? doc.get('logo') : '',
      coverPicture: doc.data().toString().contains('coverPicture')
          ? doc.get('coverPicture')
          : '',
      phoneNumber: doc.data().toString().contains('phoneNumber')
          ? doc.get('phoneNumber')
          : '',
      description: doc.data().toString().contains('description')
          ? doc.get('description')
          : '',
      address:
          doc.data().toString().contains('address') ? doc.get('address') : '',
      latitude:
          doc.data().toString().contains('latitude') ? doc.get('latitude') : '',
      longitude: doc.data().toString().contains('longitude')
          ? doc.get('longitude')
          : '',
    );
  }
  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'idRestaurant': idRestaurant,
      'name': name,
      'rating': rating,
      'logo': logo,
      'coverPicture': coverPicture,
      'phoneNumber': phoneNumber,
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  Map<String, dynamic> logoToJSON() {
    return {'logo': logo};
  }

  Map<String, dynamic> coverToJSON() {
    return {'coverPicture': coverPicture};
  }

  Map<String, dynamic> locationToJSON() {
    return {'latitude': latitude, 'longitude': longitude};
  }
}
