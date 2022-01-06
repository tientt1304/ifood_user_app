import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifood_user_app/models/notification_model.dart';
import 'package:ifood_user_app/notifier/notification_notifier.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

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

addUpdateNotification(Function notiAdded, String title) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  String idNoti = (new DateTime.now().microsecondsSinceEpoch).toString();
  DateTime? date = DateTime.now();
  NotificationModel notificationModel =
      new NotificationModel(idNotification: idNoti, title: title, date: date);

  await FirebaseFirestore.instance
      .collection('notifications')
      .doc(_authCurrentUser!.email)
      .collection('noti')
      .doc(idNoti)
      .set({
    'idNotification': idNoti,
    'idBill': '',
    'date': date,
    'title': title,
  });

  notiAdded(notificationModel);
}

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

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id', 'channel name',
          //importance: Importance.max,
        ),
        iOS: IOSNotificationDetails());
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(settings,
        onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
