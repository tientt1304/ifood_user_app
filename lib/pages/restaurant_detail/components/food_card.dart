import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_food.dart';
import 'package:ifood_user_app/models/food_model.dart';

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
  int count = 0;
  void descrementCount() {
    setState(() {
      count--;
    });
  }

  void increamentCount() {
    setState(() {
      count++;
    });
  }

  FoodFB foodFB = new FoodFB();
  @override
  Widget build(BuildContext context) {
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
                    onTap: () {},
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
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.02,
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: descrementCount,
                                  child: Container(
                                    width: 30,
                                    height: 25,
                                    //padding: EdgeInsets.all(2),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '$count',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: increamentCount,
                                  child: Container(
                                    width: 30,
                                    height: 25,
                                    //padding: EdgeInsets.all(2),
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    color: primaryColor,
                                  ),
                                ),
                              ),
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
