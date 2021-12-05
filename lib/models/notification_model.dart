import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class NotificationModel {
  String idNotify;
  String title;
  String content;
  String date;
  NotificationModel(
      {required this.idNotify,
      required this.title,
      required this.content,
      required this.date});

  //receiving data from server
  factory NotificationModel.fromDocument(DocumentSnapshot doc) {
    String temp = DateFormat('dd-MM-yyyy hh:mm a').format(doc['date'].toDate());
    return NotificationModel(
      idNotify: doc["idNotify"],
      title: doc['title'],
      content: doc['content'],
      date: temp,
    );
  }
  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'idNotify': idNotify,
      'title': title,
      'content': content,
      'date': date,
    };
  }
}
