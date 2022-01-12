import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/models/restaurant_model.dart';
import 'package:ifood_user_app/notifier/food_notifier.dart';

class RestaurantNotifier with ChangeNotifier {
  List<RestaurantModel> _restaurantList = [];
  List<RestaurantModel> _restaurantBestRateList = [];
  RestaurantModel? _currentRestaurant;

  // UnmodifiableListView<RestaurantModel> get restaurantList =>
  //     UnmodifiableListView(_restaurantList);
  List<RestaurantModel> get restaurantList => _restaurantList;
  UnmodifiableListView<RestaurantModel> get restaurantBestRateList =>
      UnmodifiableListView(_restaurantBestRateList);

  RestaurantModel get currentRestaurant => _currentRestaurant!;

  set restaurantList(List<RestaurantModel> restaurantList) {
    _restaurantList = restaurantList;
    notifyListeners();
  }

  set restaurantBestRateList(List<RestaurantModel> restaurantBestRateList) {
    _restaurantBestRateList = restaurantBestRateList;
    notifyListeners();
  }

  set currentRestaurant(RestaurantModel currentRestaurant) {
    _currentRestaurant = currentRestaurant;
    notifyListeners();
  }

  averageRatingAllRestaurant(FoodNotifier foodNotifier) {
    _restaurantList.forEach((restaurant) {
      num rating = 0;
      int count = 0;
      foodNotifier.foodList.forEach((food) {
        if (restaurant.idRestaurant == food.idRestaurant) {
          rating += food.ratingFood!;
          count++;
        }
      });
      restaurant.rating = rating / count;
    });
  }
}
