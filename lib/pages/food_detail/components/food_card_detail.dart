import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_food.dart';
import 'package:ifood_user_app/models/food_model.dart';
import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';

class FoodCardDetail extends StatefulWidget {
  const FoodCardDetail({
    Key? key,
    required this.idFood,
  }) : super(key: key);
  final String idFood;

  @override
  State<FoodCardDetail> createState() => _FoodCardDetailState();
}

class _FoodCardDetailState extends State<FoodCardDetail> {
  FoodFB foodFB = new FoodFB();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: foodFB.collectionReference
            .where('idFood', isEqualTo: widget.idFood)
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
                          flex: 3,
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
