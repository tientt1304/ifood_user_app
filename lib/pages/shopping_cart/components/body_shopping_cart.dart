import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_cart.dart';
import 'package:ifood_user_app/models/cart_model.dart';
import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';
import 'package:ifood_user_app/providers/cart_provider.dart';
import 'package:ifood_user_app/widgets/check_out_bar.dart';
import 'package:provider/provider.dart';

class BodyShoppingCart extends StatefulWidget {
  BodyShoppingCart({Key? key}) : super(key: key);

  @override
  _BodyShoppingCartState createState() => _BodyShoppingCartState();
}

class _BodyShoppingCartState extends State<BodyShoppingCart> {
  CartFB cartFB = new CartFB();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Provider.of<CartProvider>(context, listen: false).listCartModel.clear();
    return SafeArea(
      child: Stack(
        children: <Widget>[
          CheckOutBar(
            numOfItems: cart.itemCountx,
            //total: cart.totalAmount,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight! * 0.8,
              child: StreamBuilder(
                stream: cartFB.collectionReference
                    .doc(FirebaseAuth.instance.currentUser!.email)
                    .collection('items')
                    .snapshots(includeMetadataChanges: true),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: primaryColor,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot x = snapshot.data!.docs[index];
                        CartModel cartModel = CartModel.fromDocument(x);

                        Provider.of<CartProvider>(context)
                            .listCartModel
                            .add(cartModel);

                        return Slidable(
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  // cartFB.delete(x.id);
                                  // cart.deleteItem(x.id);
                                  setState(() {
                                    cartFB.delete(x.id);
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .listCartModel
                                        .clear();
                                    cartFB.getList();
                                  });
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
                                  builder: (context) => FoodDetailScreen(
                                      idFood: cartModel.idFood)));
                            },
                            child: Card(
                              elevation: 2,
                              child: ListTile(
                                leading: Image.network(cartModel.images,
                                    width: 70, fit: BoxFit.fitWidth),
                                title: Text(cartModel.name),
                                subtitle: Text('x ${cartModel.quantity}'),
                                trailing: Text(
                                    '${cartModel.price * cartModel.quantity} VND'),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
