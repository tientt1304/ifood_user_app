import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_food.dart';
import 'package:ifood_user_app/models/food_model.dart';
import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';
import 'package:ifood_user_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({
    Key? key,
    required this.idRestaurant,
  }) : super(key: key);
  final String idRestaurant;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  FoodFB foodFB = new FoodFB();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return StreamBuilder(
        stream: foodFB.collectionReference
            .where('idRestaurant', isEqualTo: widget.idRestaurant)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('No Data'),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot x = snapshot.data!.docs[index];
                FoodModel foodModel = FoodModel.fromDocument(x);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              FoodDetailScreen(idFood: foodModel.idFood)));
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20, left: 10),
                            child: Container(
                              color: bgColor,
                              child: Image.network(
                                foodModel.images,
                                width: 70,
                                height: 70,
                                fit: BoxFit.fitHeight,
                                //height: 70,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodModel.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 1.5,
                                    height: 2),
                              ),
                              Text('${foodModel.price} VND'),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.02,
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            onPressed: () async {
                              cart.addItem(
                                  foodModel.idRestaurant,
                                  foodModel.idFood,
                                  foodModel.images,
                                  foodModel.name,
                                  foodModel.price);
                            },
                            child: Text(
                              '+',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
