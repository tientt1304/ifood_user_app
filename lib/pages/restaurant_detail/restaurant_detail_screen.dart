import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/restaurant_detail/components/body_restaurant_detail.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static String routeName = '/restaurantdetail';
  const RestaurantDetailScreen(
      {Key? key, required this.idRestaurant, this.distance})
      : super(key: key);
  final String idRestaurant;
  final double? distance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyRestaurantDetail(
        id: idRestaurant,
        distance: distance,
      ),
    );
  }
}
