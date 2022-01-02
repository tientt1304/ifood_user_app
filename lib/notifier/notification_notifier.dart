import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/models/notification_model.dart';

class NotificationNotifier with ChangeNotifier {
  List<NotificationModel> _notiList = [];
  NotificationModel? _currentNoti;

  UnmodifiableListView<NotificationModel> get notiList =>
      UnmodifiableListView(_notiList);

  NotificationModel get currentNoti => _currentNoti!;
  set notiList(List<NotificationModel> notiList) {
    _notiList = notiList;
    notifyListeners();
  }

  set currentNoti(NotificationModel currentNoti) {
    _currentNoti = currentNoti;
    notifyListeners();
  }

  addNoti(NotificationModel notificationModel) {
    _notiList.add(notificationModel);
    notifyListeners();
  }

  deleteNoti(NotificationModel notificationModel) {
    _notiList.removeWhere(
        (_noti) => _noti.idNotification == notificationModel.idNotification);
    notifyListeners();
  }
}
