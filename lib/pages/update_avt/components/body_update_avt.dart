import 'package:flutter/material.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

class BodyUpdateAvt extends StatelessWidget {
  const BodyUpdateAvt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                  title: 'Update Photo',
                  content:
                      'This data will be displayed in your account profile \nfor security'),
              //ButtonCard(img: 'assets/images/Gallery.svg', text: 'From Gallery'),
            ],
          ),
        ),
      ),
    );
  }
}
