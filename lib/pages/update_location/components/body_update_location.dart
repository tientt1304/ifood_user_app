import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/select_location/set_location_screen.dart';
import 'package:ifood_user_app/pages/success_screens/register_success_screen.dart';
import 'package:ifood_user_app/pages/update_location/components/button_location_card.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:ifood_user_app/widgets/contents/title_content.dart';

import '../../../SizeConfig.dart';

class BodyUpdateLocation extends StatelessWidget {
  const BodyUpdateLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleContent(
                  title: 'Set Your Location',
                  content:
                      'This data will be displayed \nin your account profile for security'),
              Column(
                children: [
                  ButtonLocationCard(
                    location: 'Vinh Thanh, Binh Dinh',
                    onPress: () {
                      Navigator.pushNamed(context, SetLocationScreen.routeName);
                    },
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.25,
              ),
              MainButton(
                  title: 'Continue',
                  onPress: () {
                    Navigator.pushNamed(
                        context, RegisterSuccessScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
