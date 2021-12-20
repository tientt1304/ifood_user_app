import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifood_user_app/models/food_model.dart';
import 'package:ifood_user_app/notifier/food_notifier.dart';

getFoods(FoodNotifier foodNotifier) async {
  List<FoodModel> _foodList = [];
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('foods').get();
  querySnapshot.docs.map((doc) {
    FoodModel foodModel = FoodModel.fromDocument(doc);
    _foodList.add(foodModel);
  });

  foodNotifier.foodList = _foodList;
}
