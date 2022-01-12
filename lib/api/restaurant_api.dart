import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifood_user_app/models/restaurant_model.dart';
import 'package:ifood_user_app/notifier/restaurant_notifier.dart';

getRestaurants(RestaurantNotifier restaurantNotifier) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('restaurants').get();

  List<RestaurantModel> _restaurantList = [];

  querySnapshot.docs.forEach((doc) {
    RestaurantModel restaurantModel = RestaurantModel.fromDocument(doc);

    _restaurantList.add(restaurantModel);
  });

  restaurantNotifier.restaurantList = _restaurantList;
}

getBestRateRestaurants(RestaurantNotifier restaurantNotifier) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('restaurants').get();
  List<RestaurantModel> _restaurantBestRateList = [];

  querySnapshot.docs.forEach((doc) {
    RestaurantModel restaurantModel = RestaurantModel.fromDocument(doc);

    _restaurantBestRateList.add(restaurantModel);
  });
  _restaurantBestRateList.sort((a, b) => b.rating!.compareTo(a.rating!));
  restaurantNotifier.restaurantBestRateList = _restaurantBestRateList;
}
