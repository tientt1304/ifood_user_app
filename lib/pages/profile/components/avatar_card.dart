import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:image_picker/image_picker.dart';

class AvatarCard extends StatelessWidget {
  final File image;
  final ValueChanged<ImageSource> onClicked;
  const AvatarCard({Key? key, required this.image, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(context),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));
    return ClipOval(
        child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: image as ImageProvider,
        fit: BoxFit.cover,
        width: SizeConfig.screenWidth! * 0.3,
        height: SizeConfig.screenWidth! * 0.3,
      ),
    ));
  }

  Widget buildEditIcon() => buildCirCle(
        color: Colors.white,
        all: 3,
        child: buildCirCle(
          color: mainColor,
          all: 10,
          child: Icon(
            Icons.edit,
            size: 15,
            color: Colors.white,
          ),
        ),
      );
  Widget buildCirCle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
          child: Container(
              color: color, padding: EdgeInsets.all(all), child: child));
}
