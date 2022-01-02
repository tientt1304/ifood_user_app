import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifood_user_app/models/notification_model.dart';
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

addNotification(String? idBill, Function notiAdded, String title) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  String idNoti = (new DateTime.now().microsecondsSinceEpoch).toString();
  DateTime? date = DateTime.now();
  NotificationModel notificationModel = new NotificationModel(
      idNotification: idNoti, idBill: idBill, title: title, date: date);

  await FirebaseFirestore.instance
      .collection('notifications')
      .doc(_authCurrentUser!.email)
      .collection('noti')
      .doc(idNoti)
      .set({
    'idNotification': idNoti,
    'idBill': idBill,
    'date': date,
    'title': title,
  });

  notiAdded(notificationModel);
}

// checkReceivedBill(BillModel billModel) async {
//   final _authCurrentUser = FirebaseAuth.instance.currentUser;
//   await FirebaseFirestore.instance
//       .collection('users-cart-items')
//       .doc(_authCurrentUser!.email)
//       .collection('bills')
//       .doc(billModel.idBill)
//       .update({'status': 'received'});
// }

// checkRatingBill(BillModel billModel) async {
//   final _authCurrentUser = FirebaseAuth.instance.currentUser;
//   await FirebaseFirestore.instance
//       .collection('users-cart-items')
//       .doc(_authCurrentUser!.email)
//       .collection('bills')
//       .doc(billModel.idBill)
//       .update({'isRating': true});
// }

deleteNoti(NotificationModel notificationModel, Function notiDeleted) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection('notifications')
      .doc(_authCurrentUser!.email)
      .collection('noti')
      .doc(notificationModel.idNotification)
      .delete();
  notiDeleted(notificationModel);
}
