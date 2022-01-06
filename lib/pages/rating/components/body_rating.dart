import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/api/bill_api.dart';
import 'package:ifood_user_app/api/notification_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/models/notification_model.dart';
import 'package:ifood_user_app/notifier/notification_notifier.dart';
import 'package:ifood_user_app/widgets/bottom_bar/bottom_bar.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:provider/provider.dart';

class BodyRating extends StatefulWidget {
  const BodyRating({Key? key, required this.idBill}) : super(key: key);
  final String? idBill;
  @override
  State<BodyRating> createState() => _BodyRatingState();
}

class _BodyRatingState extends State<BodyRating> {
  final _formKey = GlobalKey<FormState>();

  final _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    num? ratingBill;
    NotificationNotifier notificationNotifier =
        Provider.of<NotificationNotifier>(context);
    notiAdded(NotificationModel noti) {
      notificationNotifier.addNoti(noti);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight! * 0.08,
                bottom: SizeConfig.screenHeight! * 0.02),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ffeedback.png?alt=media&token=d5b16f15-c2f1-4521-9600-3caae70863e8',
              width: SizeConfig.screenWidth! * 0.5,
              height: SizeConfig.screenWidth! * 0.5,
            ),
          ),
          Text(
            'Thank you! Enjoy your meal',
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 22, height: 2),
          ),
          Text('Please rate your food', style: TextStyle(height: 2)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                ratingBill = rating;
                print(ratingBill);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 8.0,
                bottom: SizeConfig.screenHeight! * 0.02,
                left: 8,
                right: 8),
            child: Form(
              key: _formKey,
              child: buildFeedbackTextField(),
            ),
          ),
          MainButton(
              title: 'Rating',
              onPress: () {
                NotificationApi.showNotification(
                    title: 'Rating Successful',
                    body: 'Order ${widget.idBill} has been rating success',
                    payload: 'Rating Successful');
                checkRatingBill(
                    widget.idBill, ratingBill, _feedbackController.text);
                Fluttertoast.showToast(msg: 'Rating successful');
                addNotification(widget.idBill, notiAdded, 'rating');
                Navigator.pushNamedAndRemoveUntil(
                    context, BottomBar.routeName, (route) => false);
              })
        ],
      ),
    );
  }

  TextFormField buildFeedbackTextField() => TextFormField(
        controller: _feedbackController,
        onSaved: (value) {
          _feedbackController.text = value.toString();
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
            labelText: 'Feedback',
            hintText: 'How do you feel?',
            prefixIcon: Icon(
              Icons.feedback_sharp,
              color: secondaryColor,
            )),
      );
}
