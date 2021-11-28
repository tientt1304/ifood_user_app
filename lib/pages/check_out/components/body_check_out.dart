import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_cart.dart';
import 'package:ifood_user_app/models/cart_model.dart';
import 'package:ifood_user_app/pages/check_out/components/deli_information_form.dart';
import 'package:ifood_user_app/pages/success_screens/order_cuccess_screen.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';

class BodyCheckOut extends StatefulWidget {
  const BodyCheckOut({Key? key}) : super(key: key);

  @override
  State<BodyCheckOut> createState() => _BodyCheckOutState();
}

class _BodyCheckOutState extends State<BodyCheckOut> {
  CartFB cartFB = new CartFB();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              DeliInformationForm(),
              Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight! * 0.8,
                  child: StreamBuilder(
                    stream: cartFB.collectionReference
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection('items')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text(' Something wrong'));
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot x = snapshot.data!.docs[index];
                              CartModel cartModel = CartModel.fromDocument(x);
                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: Image.network(cartModel.images,
                                      width: 70, fit: BoxFit.fitWidth),
                                  title: Text(cartModel.name),
                                  subtitle: Text('x ${cartModel.quantity}'),
                                  trailing: Text(
                                      '${cartModel.price * cartModel.quantity} VND'),
                                ),
                              );
                            });
                      }
                    },
                  )),
            ],
          ),
        ),
        Positioned(
            width: SizeConfig.screenWidth,
            bottom: 0.0,
            child: Card(
              margin: EdgeInsets.only(bottom: 0.0),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'CASH',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                minimumSize:
                                    Size(SizeConfig.screenWidth! * 0.35, 45),
                                primary: Colors.white,
                                onPrimary: primaryColor,
                                side: BorderSide(color: primaryColor)),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'MOMO WALLET',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                minimumSize:
                                    Size(SizeConfig.screenWidth! * 0.35, 45),
                                primary: Colors.white,
                                onPrimary: primaryColor,
                                side: BorderSide(color: primaryColor)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Sub Total: 29000 VND',
                      style: TextStyle(fontSize: 18, height: 2),
                    ),
                    Text(
                      'Shipping Fee: 29000 VND',
                      style: TextStyle(fontSize: 18, height: 2),
                    ),
                    Divider(
                      height: 4,
                      thickness: 1.5,
                    ),
                    Text(
                      'Total: 58000 VND',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                    ),
                    Center(
                        child: MainButton(
                            title: 'Place Order',
                            onPress: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  OrderSuccessScreen.routeName,
                                  (route) => false);
                            }))
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
