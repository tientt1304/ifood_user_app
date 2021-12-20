import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:ifood_user_app/models/food_model.dart';

class FoodNotifier with ChangeNotifier {
  List<FoodModel> _foodList = [];
  FoodModel? _currentFood;
  UnmodifiableListView<FoodModel> get foodList =>
      UnmodifiableListView(_foodList);

  FoodModel get currentFood => _currentFood!;

  set foodList(List<FoodModel> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentFood(FoodModel food) {
    _currentFood = food;
    notifyListeners();
  }
}
