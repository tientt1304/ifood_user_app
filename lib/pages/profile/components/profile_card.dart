import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {Key? key, this.title, this.prefixIcon, required this.onPress})
      : super(key: key);
  final title, prefixIcon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.05,
          vertical: SizeConfig.screenWidth! * 0.02),
      elevation: 2,
      child: GestureDetector(
          onTap: onPress,
          child: ListTile(
            leading: Image.network(prefixIcon),
            title: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          )),
    );
  }
}
