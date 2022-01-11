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
    if (foodModel.category == category) {
      _categoryFoodList.add(foodModel);
    }
  });

  foodNotifier.categoryFoodList = _categoryFoodList;
}

getCategory2Foods(FoodNotifier foodNotifier, String? category) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('foods').get();
  List<FoodModel> _categoryFoodList = [];
  querySnapshot.docs.forEach((doc) {
    FoodModel foodModel = FoodModel.fromDocument(doc);
    switch (category) {
      case 'food':
        if (foodModel.category == 'rice' ||
            foodModel.category == 'snacks' ||
            foodModel.category == 'noodles' ||
            foodModel.category == 'cake' ||
            foodModel.category == 'seafood') {
          _categoryFoodList.add(foodModel);
        }

        break;
      case 'drink':
        if (foodModel.category == 'milk tea' ||
            foodModel.category == 'soft drink') {
          _categoryFoodList.add(foodModel);
        }
        break;
      case 'vege':
        if (foodModel.category == 'vegetable') {
          _categoryFoodList.add(foodModel);
        }
        break;
      case 'cake':
        if (foodModel.category == 'cake') {
          _categoryFoodList.add(foodModel);
        }
        break;
      case 'all':
        if (foodModel.category == 'rice' ||
            foodModel.category == 'snacks' ||
            foodModel.category == 'noodles' ||
            foodModel.category == 'cake' ||
            foodModel.category == 'seafood' ||
            foodModel.category == 'milk tea' ||
            foodModel.category == 'soft drink') {
          _categoryFoodList.add(foodModel);
        }

        break;
    }
  });

  foodNotifier.categoryFoodList = _categoryFoodList;
}
