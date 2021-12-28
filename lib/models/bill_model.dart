import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifood_user_app/models/cart_model.dart';

class BillModel {
  String? idBill;
  List<CartModel>? carts;
  num total;
  num subTotal;
  num shippingFee;
  String? uid;
  String? email;
  String? name;
  String? phoneNumber;
  String? comment;
  String? latitude;
  String? longitude;
  String? status;
  num itemCount;
  bool isRating;

  BillModel(
      {this.idBill,
      this.carts,
      this.total = 0,
      this.subTotal = 0,
      this.shippingFee = 15000,
      this.uid,
      this.email,
      this.name,
      this.phoneNumber,
      this.comment,
      this.latitude,
      this.longitude,
      this.status,
      this.itemCount = 0,
      this.isRating = false});

  //receiving data from server
  factory BillModel.fromDocument(DocumentSnapshot doc) {
    return BillModel(
      idBill: doc.data().toString().contains('idBill') ? doc.get('idBill') : '',
      // carts: doc.get('carts'),
      total: doc.data().toString().contains('total') ? doc.get('total') : 0,
      subTotal:
          doc.data().toString().contains('idFood') ? doc.get('subTotal') : 0,
      shippingFee: doc.data().toString().contains('shippingFee')
          ? doc.get('shippingFee')
          : 15000,
      uid: doc.data().toString().contains('uid') ? doc.get('uid') : '',
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      phoneNumber: doc.data().toString().contains('phoneNumber')
          ? doc.get('phoneNumber')
          : 0,
      comment: doc.data().toString().contains('comment')
          ? doc.get('comment')
          : 15000,
      latitude:
          doc.data().toString().contains('latitude') ? doc.get('latitude') : '',
      longitude: doc.data().toString().contains('longitude')
          ? doc.get('longitude')
          : '',
      status: doc.data().toString().contains('status') ? doc.get('status') : '',
      itemCount: doc.data().toString().contains('itemCount')
          ? doc.get('itemCount')
          : 0,
      isRating: doc.data().toString().contains('isRating')
          ? doc.get('isRating')
          : false,
    );
  }
  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'idBill': idBill,
      'carts': carts,
      'total': total,
      'subTotal': subTotal,
      'shippingFee': shippingFee,
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'comment': comment,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'itemCount': itemCount,
      'isRating': isRating
    };
  }
}
