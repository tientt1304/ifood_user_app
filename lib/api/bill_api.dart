import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifood_user_app/api/cart_api.dart';
import 'package:ifood_user_app/models/bill_model.dart';
import 'package:ifood_user_app/notifier/bill_notifier.dart';
import 'package:ifood_user_app/notifier/cart_notifier.dart';

getBills(BillNotifier billNotifier) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('users-cart-items')
      .doc(_authCurrentUser!.email)
      .collection('bills')
      .get();
  List<BillModel> _billList = [];
  querySnapshot.docs.forEach((doc) {
    BillModel billModel = BillModel.fromDocument(doc);
    _billList.add(billModel);
  });

  billNotifier.billList = _billList;
}

addBill(
    BillModel billModel, Function billAdded, CartNotifier cartNotifier) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  String idBill = (new DateTime.now().microsecondsSinceEpoch).toString();
  getCarts(cartNotifier);
  cartNotifier.carts.forEach((item) {
    FirebaseFirestore.instance
        .collection('users-cart-items')
        .doc(_authCurrentUser!.email)
        .collection('bills')
        .doc(idBill)
        .collection('items')
        .doc(item.idCart)
        .set({
      'idCart': item.idCart,
      'idFood': item.idFood,
      'idRestaurant': item.idRestaurant,
      'name': item.name,
      'quantity': item.quantity,
      'images': item.images,
      'price': item.price
    });
  });

  await FirebaseFirestore.instance
      .collection('users-cart-items')
      .doc(_authCurrentUser!.email)
      .collection('bills')
      .doc(idBill)
      .set({
    'idBill': idBill,
    'total': billModel.total,
    'subTotal': billModel.subTotal,
    'shippingFee': billModel.shippingFee,
    'uid': billModel.uid,
    'email': billModel.email,
    'name': billModel.name,
    'phoneNumber': billModel.phoneNumber,
    'comment': billModel.comment,
    'latitude': billModel.latitude,
    'longitude': billModel.longitude,
    'status': billModel.status,
    'itemCount': billModel.itemCount,
    'isRating': billModel.isRating
  });

  billAdded(billModel);
}

checkReceivedBill(BillModel billModel) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection('users-cart-items')
      .doc(_authCurrentUser!.email)
      .collection('bills')
      .doc(billModel.idBill)
      .update({'status': 'received'});
}

checkRatingBill(BillModel billModel) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection('users-cart-items')
      .doc(_authCurrentUser!.email)
      .collection('bills')
      .doc(billModel.idBill)
      .update({'isRating': true});
}
