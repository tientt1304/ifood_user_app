import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/models/notification_model.dart';
import 'package:ifood_user_app/pages/notification/components/notification_item.dart';


class BodyNotification extends StatelessWidget {
  const BodyNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(SizeConfig.screenWidth!*0.05),
          ),
          Expanded(
            
            child: ListView.builder(
              itemCount: demoNotifications.length,
              itemBuilder: (context, index) {
                return NotificationItem(
                    index: index, notification: demoNotifications[index]);
              },
              
            ),
          ),
        ],
        
      ),
    );
  }
}