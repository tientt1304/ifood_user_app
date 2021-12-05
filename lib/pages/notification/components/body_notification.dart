import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_notification.dart';
import 'package:ifood_user_app/models/notification_model.dart';

class BodyNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _notify(context);
  }
}

Widget _notify(BuildContext context) {
  NotificationFB notificationFB = NotificationFB();
  return StreamBuilder(
      stream: notificationFB.collectionReference.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            color: primaryColor,
          ));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              QueryDocumentSnapshot noti = snapshot.data!.docs[index];
              NotificationModel notificationModel =
                  NotificationModel.fromDocument(noti);
              return ListTile(
                title: Text(notificationModel.title,
                    style: TextStyle(
                        color: kTitleColor, fontWeight: FontWeight.bold)),
                subtitle: Text(notificationModel.content,
                    style: TextStyle(color: kTextColor)),
              );
            },
          );
        }
      });
}
