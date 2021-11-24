import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';

class BodyShoppingCart extends StatefulWidget {
  BodyShoppingCart({Key? key}) : super(key: key);

  @override
  _BodyShoppingCartState createState() => _BodyShoppingCartState();
}

class _BodyShoppingCartState extends State<BodyShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight! * 0.8,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users-cart-items')
                    .doc(FirebaseAuth.instance.currentUser!.email)
                    .collection('item')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2FGroup.png?alt=media&token=2b71dcf9-19a8-48cd-8d67-c8dc2bc712a3'),
                          Text(
                            'I’m famished!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Fill me up quickly by adding some items')
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot x = snapshot.data!.docs[index];

                          return Slidable(
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    FirebaseFirestore.instance
                                        .collection('users-cart-items')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.email)
                                        .collection('item')
                                        .doc(x.id)
                                        .delete();

                                    Fluttertoast.showToast(
                                        msg: 'Delete food successful');
                                  },
                                  backgroundColor: primaryColor,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        FoodDetailScreen(idFood: x['idFood'])));
                              },
                              child: Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: Image.network(x['images'],
                                      width: 70, fit: BoxFit.fitWidth),
                                  title: Text(x['name']),
                                  subtitle: Text('x ${x['quantity']}'),
                                  trailing:
                                      Text('${x['price'] * x['quantity']} VND'),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text('Total: total'),
          )
        ],
      ),
    );
  }
}
