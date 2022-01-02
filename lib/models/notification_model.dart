import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String? idNotification;
  String? idBill;
  DateTime? date;
  String title;

  NotificationModel({
    this.idNotification,
    this.idBill,
    this.date,
    this.title = '',
  });

  //receiving data from server
  factory NotificationModel.fromDocument(DocumentSnapshot doc) {
    return NotificationModel(
      idNotification: doc.data().toString().contains('idNotification')
          ? doc.get('idNotification')
          : '',
      idBill: doc.data().toString().contains('idBill') ? doc.get('idBill') : '',
      // date: doc['date'],
      title: doc.data().toString().contains('title') ? doc.get('title') : '',
    );
  }
  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'idNotification': idNotification,
      'idBill': idBill,
      'date': date,
      'title': title,
    };
  }
}
