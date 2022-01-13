import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/api/cart_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_cart.dart';
import 'package:ifood_user_app/models/cart_model.dart';
import 'package:ifood_user_app/notifier/cart_notifier.dart';
import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';
import 'package:ifood_user_app/widgets/check_out_bar.dart';
import 'package:provider/provider.dart';

class BodyShoppingCart extends StatefulWidget {
  BodyShoppingCart({Key? key}) : super(key: key);

  @override
  _BodyShoppingCartState createState() => _BodyShoppingCartState();
}

class _BodyShoppingCartState extends State<BodyShoppingCart> {
  CartFB cartFB = new CartFB();
  num countItem = 0;
  num total = 0;
  getCountItem(CartNotifier cartNotifier) async {
    getCarts(cartNotifier);
    countItem = await cartNotifier.countItems();
    return countItem;
  }

  @override
  void initState() {
    CartNotifier cartNotifier =
        Provider.of<CartNotifier>(context, listen: false);
    getCountItem(cartNotifier);
    total = cartNotifier.total();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartNotifier cartNotifier = Provider.of<CartNotifier>(context);
    Future<void> _refreshList() async {
      getCarts(cartNotifier);
      countItem = cartNotifier.countItems();
      total = cartNotifier.total();
    }

    _onCartDeleted(CartModel cartModel) {
      cartNotifier.deleteCart(cartModel);
    }

    return SafeArea(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: RefreshIndicator(
              color: primaryColor,
              onRefresh: _refreshList,
              child: ListView.builder(
                itemCount: cartNotifier.carts.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              deleteCart(
                                  cartNotifier.carts[index], _onCartDeleted);
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
                                idFood: cartNotifier.carts[index].idFood)));
                      },
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          leading: Image.network(
                              cartNotifier.carts[index].images,
                              width: 70,
                              fit: BoxFit.fitWidth),
                          title: Text(cartNotifier.carts[index].name),
                          subtitle:
                              Text('x ${cartNotifier.carts[index].quantity}'),
                          trailing: Text(
                              '${cartNotifier.carts[index].price * cartNotifier.carts[index].quantity} VND'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          countItem > 0
              ? CheckOutBar(
                  numOfItems: countItem,
                  total: total,
                )
              : Container(),
        ],
      ),
    );
  }
}
