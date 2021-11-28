import 'package:flutter/material.dart';
import 'package:ifood_user_app/models/food_model.dart';

class FoodsProvider with ChangeNotifier {
  List<FoodModel> _items = [];

  List<FoodModel> get items {
    return [..._items]; // return copy of _items
  }

  void addFood() {
    //_items.add(value);
    notifyListeners();
  }
}
