import 'package:flutter/material.dart';
import 'package:ifood_user_app/pages/food_detail/components/body_food_detail.dart';

class FoodDetailScreen extends StatelessWidget {
  static String routeName = '/fooddetail';
  const FoodDetailScreen({Key? key, required this.idFood}) : super(key: key);
  final String idFood;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyFoodDetail(
        idFood: idFood,
      ),
    );
  }
}
