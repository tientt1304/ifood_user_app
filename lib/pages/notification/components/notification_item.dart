import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/models/notification_model.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.notification,
    required this.index,
  }) : super(key: key);

  final NotificationModel notification;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenHeight(SizeConfig.screenHeight!*0.03),
        getProportionateScreenHeight(SizeConfig.screenHeight!*0.03),
        getProportionateScreenHeight(SizeConfig.screenHeight!*0.03),
        index == demoNotifications.length - 1
            ? getProportionateScreenHeight(SizeConfig.screenHeight!*0.03)
            : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(5)),
              SizedBox(
                width: getProportionateScreenHeight(SizeConfig.screenHeight!*0.06),
                height: getProportionateScreenHeight(SizeConfig.screenHeight!*0.06),
                child: Container(
                    // padding: EdgeInsets.all(getProportionateScreenWidth(SizeConfig.screenWidth!*0.06)),
                    // decoration: BoxDecoration(
                    //   color: kgrey,
                    //   borderRadius: BorderRadius.circular(50),
                    // ),
                    child: renderOrderIcon(orderType: notification.orderType),
                    ),
              ),
            ],
          ),
          SizedBox(width: getProportionateScreenWidth(SizeConfig.screenWidth!*0.05)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                renderNotificationTitle(orderType: notification.orderType),
                renderNotificationContent(
                  orderId: notification.orderId,
                  orderType: notification.orderType,
                  price: notification.price,
                ),
                Text(notification.time,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(SizeConfig.screenWidth!*0.03),
                      color: Colors.grey,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  SvgPicture renderOrderIcon({required NotificationType orderType}) {
    String asset = 'Parcel.svg';
    switch (orderType) {
      case NotificationType.success:
        asset = 'Check_mark.svg';
        break;
      case NotificationType.confirmed:
        asset = 'Cash.svg';
        break;
      case NotificationType.canceled:
        asset = 'Close.svg';
        break;
      default:
    }
    return SvgPicture.asset('assets/icons/$asset');
  }
}