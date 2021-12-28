import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifood_user_app/models/bill_model.dart';
import 'package:ifood_user_app/models/notification_model.dart';
import 'package:ifood_user_app/notifier/bill_notifier.dart';
import 'package:ifood_user_app/notifier/notification_notifier.dart';

getNotifications(NotificationNotifier notificationNotifier) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('notifications')
      .doc(_authCurrentUser!.email)
      .collection('noti')
      .get();
  List<NotificationModel> _notiList = [];
  querySnapshot.docs.forEach((doc) {
    NotificationModel notificationModel = NotificationModel.fromDocument(doc);
    _notiList.add(notificationModel);
  });

  notificationNotifier.notiList = _notiList;
}

addNotification(BillModel billModel, Function notiAdded) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  String idNoti = (new DateTime.now().microsecondsSinceEpoch).toString();
  DateTime date = DateTime.now();
  NotificationModel notificationModel = new NotificationModel(
      idNotification: idNoti,
      idBill: billModel.idBill,
      title: 'ordered',
      date: date);

  await FirebaseFirestore.instance
      .collection('notifications')
      .doc(_authCurrentUser!.email)
      .collection('noti')
      .doc(idNoti)
      .set({
    'idNotification': idNoti,
    'idBill': billModel.idBill,
    'date': date,
    'title': 'ordered',
  });

  notiAdded(notificationModel);
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
