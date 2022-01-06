import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/api/notification_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/models/notification_model.dart';
import 'package:ifood_user_app/notifier/notification_notifier.dart';
import 'package:provider/provider.dart';

class BodyNotification extends StatefulWidget {
  const BodyNotification({Key? key}) : super(key: key);

  @override
  State<BodyNotification> createState() => _BodyNotificationState();
}

class _BodyNotificationState extends State<BodyNotification> {
  @override
  void initState() {
    NotificationNotifier notificationNotifier =
        Provider.of<NotificationNotifier>(context, listen: false);
    getNotifications(notificationNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NotificationNotifier notificationNotifier =
        Provider.of<NotificationNotifier>(context);

    getNotifications(notificationNotifier);

    Future<void> _refreshList() async {
      getNotifications(notificationNotifier);
    }

    _onNotiDeleted(NotificationModel noti) {
      notificationNotifier.deleteNoti(noti);
    }

    return RefreshIndicator(
      onRefresh: _refreshList,
      color: primaryColor,
      child: ListView.builder(
        itemCount: notificationNotifier.notiList.reversed.toList().length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      deleteNoti(
                          notificationNotifier.notiList.reversed
                              .toList()[index],
                          _onNotiDeleted);
                    });
                  },
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Card(
              elevation: 1,
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: notificationNotifier.notiList.reversed
                            .toList()[index]
                            .title ==
                        'ordered'
                    ? SvgPicture.asset('assets/icons/Check_mark.svg',
                        width: 40, fit: BoxFit.fitWidth)
                    : (notificationNotifier.notiList.reversed
                                .toList()[index]
                                .title ==
                            'delivered'
                        ? SvgPicture.asset('assets/icons/Parcel.svg',
                            width: 35, fit: BoxFit.fitWidth)
                        : SvgPicture.asset('assets/icons/star.svg',
                            width: 40, fit: BoxFit.fitWidth)),
                title: notificationNotifier.notiList.reversed
                            .toList()[index]
                            .title ==
                        'ordered'
                    ? Text(
                        'Order Success',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )
                    : (notificationNotifier.notiList.reversed
                                .toList()[index]
                                .title ==
                            'delivered'
                        ? Text(
                            'Order Delivered',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        : Text(
                            'Rating Success',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )),
                subtitle: notificationNotifier.notiList.reversed
                            .toList()[index]
                            .title ==
                        'ordered'
                    ? RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(text: 'Order '),
                            TextSpan(
                                text:
                                    '${notificationNotifier.notiList.reversed.toList()[index].idBill} ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor)),
                            TextSpan(
                                text:
                                    'has been success. \nPlease wait for the food to be sent'),
                            // TextSpan(
                            //     text:
                            //         '\n${notificationNotifier.notiList[index].date.toString()}',
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         color: secondaryColor)),
                          ],
                        ),
                      )
                    : (notificationNotifier.notiList.reversed
                                .toList()[index]
                                .title ==
                            'delivered'
                        ? RichText(
                            text: TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(text: 'Order '),
                                TextSpan(
                                    text:
                                        '${notificationNotifier.notiList.reversed.toList()[index].idBill} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                TextSpan(
                                    text:
                                        'has been completed and arrived at th destination address (Please rate your order)'),
                              ],
                            ),
                          )
                        : RichText(
                            text: TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(text: 'Order '),
                                TextSpan(
                                    text:
                                        '${notificationNotifier.notiList.reversed.toList()[index].idBill} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                TextSpan(text: 'has been rating success'),
                              ],
                            ),
                          )),
              ),
            ),
          );
        },
      ),
    );
  }
}
