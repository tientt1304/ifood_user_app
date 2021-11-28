import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_restaurant.dart';
import 'package:ifood_user_app/models/restaurant_model.dart';
import 'package:ifood_user_app/pages/restaurant_detail/components/food_card.dart';
import 'package:ifood_user_app/pages/shopping_cart/shopping_cart_screen.dart';
import 'package:ifood_user_app/widgets/check_out_bar.dart';

import 'package:ifood_user_app/widgets/custom_app_bar.dart';

class BodyRestaurantDetail extends StatefulWidget {
  const BodyRestaurantDetail({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<BodyRestaurantDetail> createState() => _BodyRestaurantDetailState();
}

class _BodyRestaurantDetailState extends State<BodyRestaurantDetail> {
  @override
  Widget build(BuildContext context) {
    RestaurantFB restaurantFB = new RestaurantFB();
    return StreamBuilder(
        stream: restaurantFB.collectionReference
            .where('idRestaurant', isEqualTo: widget.id)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('No Data'),
            );
          } else {
            QueryDocumentSnapshot x = snapshot.data!.docs[0];
            RestaurantModel restaurantModel = RestaurantModel.fromDocument(x);
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight! * 0.35,
                      child: Image.network(
                        restaurantModel.coverPicture,
                        fit: BoxFit.cover,
                      )),
                ),
                CustomAppBar(
                  Icons.arrow_back_ios,
                  Icons.shopping_cart,
                  leftCallBack: () => Navigator.of(context).pop(),
                  rightCallBack: () => Navigator.popAndPushNamed(
                      context, ShoppingCartScreen.routeName),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight! * 0.75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, -4),
                              blurRadius: 8)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              restaurantModel.name,
                              style:
                                  TextStyle(fontFamily: 'FSSemi', fontSize: 23),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: primaryColor,
                                ),
                                Text(
                                  ' ${restaurantModel.rating} rating',
                                  style: TextStyle(color: blurTextColor),
                                ),
                                SizedBox(width: SizeConfig.screenWidth! * 0.15),
                                Icon(
                                  Icons.location_on_outlined,
                                  color: primaryColor,
                                ),
                                Text(
                                  '8 km',
                                  style: TextStyle(color: blurTextColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              restaurantModel.description!,
                              textAlign: TextAlign.justify,
                              style: TextStyle(height: 2, wordSpacing: 2),
                            ),
                            Text(
                              'MENU',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                            FoodCard(idRestaurant: widget.id),
                            SizedBox(height: SizeConfig.screenHeight! * 0.06)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CheckOutBar()
              ],
            );
          }
        });
  }
}
