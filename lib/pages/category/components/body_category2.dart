import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/api/cart_api.dart';
import 'package:ifood_user_app/api/food_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/models/cart_model.dart';
import 'package:ifood_user_app/notifier/cart_notifier.dart';
import 'package:ifood_user_app/notifier/food_notifier.dart';
import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';
import 'package:provider/provider.dart';

class BodyCategory2 extends StatefulWidget {
  BodyCategory2({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  _BodyCategory2State createState() => _BodyCategory2State();
}

class _BodyCategory2State extends State<BodyCategory2> {
  @override
  void initState() {
    super.initState();
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getCategory2Foods(foodNotifier, widget.category);
  }

  @override
  Widget build(BuildContext context) {
    CartModel _currentCart = new CartModel();
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    CartNotifier cartNotifier = Provider.of<CartNotifier>(context);
    _onCartAdded(CartModel cartModel) {
      cartNotifier.addToCart(cartModel);
      Fluttertoast.showToast(msg: 'Added');
    }

    return foodNotifier.categoryFoodList.length != 0
        ? ListView.builder(
            itemCount: foodNotifier.categoryFoodList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(
                          idFood:
                              foodNotifier.categoryFoodList[index].idFood)));
                },
                child: ListTile(
                  leading: Image.network(
                      '${foodNotifier.categoryFoodList[index].images}',
                      width: 70,
                      fit: BoxFit.fitWidth),
                  title: Text(foodNotifier.categoryFoodList[index].name),
                  subtitle: Text(
                      foodNotifier.categoryFoodList[index].price.toString()),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 5)),
                    onPressed: () {
                      _currentCart.idFood =
                          foodNotifier.categoryFoodList[index].idFood;
                      _currentCart.idRestaurant =
                          foodNotifier.categoryFoodList[index].idRestaurant;
                      _currentCart.images =
                          foodNotifier.categoryFoodList[index].images;
                      _currentCart.name =
                          foodNotifier.categoryFoodList[index].name;
                      _currentCart.price =
                          foodNotifier.categoryFoodList[index].price;
                      cartNotifier.currentCart = _currentCart;
                      addToCart(
                          cartNotifier.currentCart, _onCartAdded, cartNotifier);
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
              );
            },
          )
        : Center(
            child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.2,
              ),
              Image.asset(
                'assets/images/noFood.png',
                width: SizeConfig.screenWidth! * 0.3,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Text(
                'No Food Found',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Items you found are absent',
              ),
            ],
          ));
  }
}
