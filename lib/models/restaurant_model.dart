import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  String? idRestaurant;
  String? name;
  double? rating;
  double? distance;
  String? time;
  String? logo;
  String? coverPicture;
  String? phoneNumber;
  String? description;
  String? address;
  String? latitude;
  String? longitude;

  RestaurantModel(
      {this.idRestaurant,
      this.name,
      this.rating,
      this.distance,
      this.time,
      this.logo,
      this.coverPicture,
      this.phoneNumber,
      this.description,
      this.address,
      this.latitude,
      this.longitude});

  //receiving data from server
  factory RestaurantModel.fromDocument(DocumentSnapshot doc) {
    return RestaurantModel(
      idRestaurant: doc.data().toString().contains('idRestaurant')
          ? doc.get('idRestaurant')
          : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      rating: doc.data().toString().contains('rating') ? doc.get('rating') : '',
      distance:
          doc.data().toString().contains('distance') ? doc.get('distance') : '',
      time: doc.data().toString().contains('time') ? doc.get('time') : '',
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
      'distance': distance,
      'time': time,
      'logo': logo,
      'coverPicture': coverPicture,
      'phoneNumber': phoneNumber,
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude
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
