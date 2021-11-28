import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/check_out/check_out_screen.dart';
// import 'package:ifood_user_app/models/cart_model.dart';
// import 'package:provider/provider.dart';

class CheckOutBar extends StatelessWidget {
  const CheckOutBar({Key? key, this.total, this.numOfItems}) : super(key: key);
  final num? total;
  final num? numOfItems;
  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<CartModel>(context);
    return Positioned(
      width: SizeConfig.screenWidth,
      //alignment: Alignment.bottomCenter,
      bottom: 0.0,
      child: GestureDetector(
        child: Card(
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: primaryColor,
                ),
              ),
              numOfItems != null ? Text('$numOfItems Items') : Text('0 Items'),
              numOfItems != null
                  ? Text(
                      '$total VND',
                      textAlign: TextAlign.end,
                    )
                  : Text(
                      '0 VND',
                      textAlign: TextAlign.end,
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: primaryColor,
                        minimumSize: Size(SizeConfig.screenWidth! * 0.4,
                            SizeConfig.screenHeight! * 0.03)),
                    onPressed: () {
                      Navigator.pushNamed(context, CheckOutScreen.routeName);
                    },
                    child: Text(
                      'Check Out',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
