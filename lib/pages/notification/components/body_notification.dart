import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ifood_user_app/constants.dart';

class BodyNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _notify(context);
  }
}

Widget _notify(BuildContext context) {
  return Container(
    child: ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            title: Text('Order status 1',
                style:
                    TextStyle(color: kTitleColor, fontWeight: FontWeight.bold)),
            subtitle: Text('Your order is on its way to delivery',
                style: TextStyle(color: kTextColor)),
          ),
          ListTile(
            title: Text('Order status 2',
                style:
                    TextStyle(color: kTitleColor, fontWeight: FontWeight.bold)),
            subtitle: Text('Your order has been delivered.',
                style: TextStyle(color: kTextColor)),
          ),
          ListTile(
            title: Text('Order status 3',
                style:
                    TextStyle(color: kTitleColor, fontWeight: FontWeight.bold)),
            subtitle: Text('The restaurant has accepted your order.',
                style: TextStyle(color: kTextColor)),
          ),
          ListTile(
            title: Text('Order status 4',
                style:
                    TextStyle(color: kTitleColor, fontWeight: FontWeight.bold)),
            subtitle: Text('Your order has been cancelled.',
                style: TextStyle(color: kTextColor)),
          ),
        ],
      ).toList(),
    ),
  );
}
