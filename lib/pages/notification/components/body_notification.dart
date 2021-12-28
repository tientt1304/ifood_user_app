import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifood_user_app/api/notification_api.dart';
import 'package:ifood_user_app/constants.dart';
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
      print('refresh');
    }

    return RefreshIndicator(
      onRefresh: _refreshList,
      color: primaryColor,
      child: ListView.builder(
        itemCount: notificationNotifier.notiList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: notificationNotifier.notiList[index].title == 'ordered'
                  ? SvgPicture.asset('assets/icons/Check_mark.svg',
                      width: 50, fit: BoxFit.fitWidth)
                  : (notificationNotifier.notiList[index].title == 'delivered'
                      ? SvgPicture.asset('assets/icons/Parcel.svg',
                          width: 50, fit: BoxFit.fitWidth)
                      : SvgPicture.asset('assets/icons/Close.svg',
                          width: 50, fit: BoxFit.fitWidth)),
              title: notificationNotifier.notiList[index].title == 'ordered'
                  ? Text(
                      'Order Success',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  : (notificationNotifier.notiList[index].title == 'delivered'
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
              subtitle: notificationNotifier.notiList[index].title == 'ordered'
                  ? RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(text: 'Order '),
                          TextSpan(
                              text:
                                  '${notificationNotifier.notiList[index].idBill} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor)),
                          TextSpan(
                              text:
                                  'has been success. \nPlease wait for the food to be sent'),
                        ],
                      ),
                    )
                  : (notificationNotifier.notiList[index].title == 'delivered'
                      ? RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(text: 'Order '),
                              TextSpan(
                                  text:
                                      '${notificationNotifier.notiList[index].idBill} ',
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
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(text: 'Order '),
                              TextSpan(
                                  text:
                                      '${notificationNotifier.notiList[index].idBill} ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor)),
                              TextSpan(text: 'has been rating success'),
                            ],
                          ),
                        )),
            ),
          );
        },
      ),
    );
  }
}
