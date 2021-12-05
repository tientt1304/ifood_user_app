import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationFB {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("notifications");
  Future<void> add(String title, String content, Timestamp date) async {
    String idNotify = (new DateTime.now().millisecondsSinceEpoch).toString();
    return FirebaseFirestore.instance
        .collection("notifications")
        .doc(idNotify)
        .set({
          'content': content,
          'date': date,
          'idNotify': idNotify,
          'title': title
        })
        .then((value) => print("completed"))
        .catchError((error) => print("fail"));
  }

  Future<void> update(
      String idNotify, String title, String content, Timestamp date) async {
    return FirebaseFirestore.instance
        .collection("notification")
        .doc(idNotify)
        .update({
          "title": title,
          'body': content,
          'date': date,
        })
        .then((value) => print("completed"))
        .catchError((error) => print("fail"));
  }

  Future<void> delete(String idNotify) async {
    return FirebaseFirestore.instance
        .collection("notification")
        .doc(idNotify)
        .delete();
  }
}
