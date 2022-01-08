import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifood_user_app/models/food_model.dart';
import 'package:ifood_user_app/notifier/food_notifier.dart';

getFoods(FoodNotifier foodNotifier) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('foods').get();
  List<FoodModel> _foodList = [];

  querySnapshot.docs.forEach((doc) {
    FoodModel foodModel = FoodModel.fromDocument(doc);

    _foodList.add(foodModel);
  });

  foodNotifier.foodList = _foodList;
}

getCategoryFoods(FoodNotifier foodNotifier, String category) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('foods').get();
  List<FoodModel> _categoryFoodList = [];

  querySnapshot.docs.forEach((doc) {
    FoodModel foodModel = FoodModel.fromDocument(doc);
    print(foodModel.category);
    if (foodModel.category == category) {
      _categoryFoodList.add(foodModel);
    }
  });

  foodNotifier.categoryFoodList = _categoryFoodList;
}
