import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_food.dart';
import 'package:ifood_user_app/models/food_model.dart';
import 'package:ifood_user_app/pages/food_detail/components/food_card_detail.dart';
import 'package:ifood_user_app/pages/shopping_cart/shopping_cart_screen.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';

import 'package:ifood_user_app/widgets/custom_app_bar.dart';

class BodyFoodDetail extends StatefulWidget {
  const BodyFoodDetail({Key? key, required this.idFood}) : super(key: key);

  final String idFood;

  @override
  State<BodyFoodDetail> createState() => _BodyFoodDetailState();
}

class _BodyFoodDetailState extends State<BodyFoodDetail> {
  //var count = 0;

  @override
  Widget build(BuildContext context) {
    FoodFB foodFB = new FoodFB();
    return StreamBuilder(
        stream: foodFB.collectionReference
            .where('idFood', isEqualTo: widget.idFood)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('No Data'),
            );
          } else {
            QueryDocumentSnapshot x = snapshot.data!.docs[0];
            FoodModel foodModel = FoodModel.fromDocument(x);
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight! * 0.5,
                      child: Image.network(
                        foodModel.images,
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
                    height: SizeConfig.screenHeight! * 0.6,
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
                            FoodCardDetail(idFood: foodModel.idFood),
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
                                  '${foodModel.ratingFood} rating',
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
                              foodModel.desc,
                              textAlign: TextAlign.justify,
                              style: TextStyle(height: 2, wordSpacing: 2),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.05,
                            ),
                            MainButton(
                                title: 'Add To Cart',
                                onPress: () async {
                                  final FirebaseAuth _auth =
                                      FirebaseAuth.instance;
                                  var currentUser = _auth.currentUser;
                                  CollectionReference _collectionRef =
                                      FirebaseFirestore.instance
                                          .collection('users-cart-items');

                                  return _collectionRef
                                      .doc(currentUser!.email)
                                      .collection('item')
                                      .doc()
                                      .set({
                                    'name': foodModel.name,
                                    'images': foodModel.images,
                                    'price': foodModel.price,
                                    'idFood': foodModel.idFood,
                                    'quantity': 1,
                                  }).then((value) => Fluttertoast.showToast(
                                          msg: 'Added item to cart'));
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        });
  }
}
