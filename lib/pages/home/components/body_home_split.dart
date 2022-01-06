import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ifood_user_app/api/food_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/models/food_model.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/notifier/food_notifier.dart';
import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';
import 'package:ifood_user_app/pages/home/components/banner.dart';
import 'package:ifood_user_app/pages/home/components/food_filter_card.dart';
import 'package:ifood_user_app/pages/home/components/food_group.dart';
import 'package:provider/provider.dart';

import '../../../SizeConfig.dart';

class BodyHomeSplit extends StatefulWidget {
  BodyHomeSplit({Key? key}) : super(key: key);

  @override
  _BodyHomeSplitState createState() => _BodyHomeSplitState();
}

class _BodyHomeSplitState extends State<BodyHomeSplit> {
  List<Map<String, String>> foodFilterList = [
    {'name': 'All', 'img': 'assets/images/all.png'},
    {'name': 'Food', 'img': 'assets/images/food.png'},
    {'name': 'Drink', 'img': 'assets/images/drinks.png'},
    {'name': 'Vege', 'img': 'assets/images/vege.png'},
    {'name': 'Cakes', 'img': 'assets/images/cake.png'},
    {'name': 'Dessert', 'img': 'assets/images/dessert.png'},
  ];
  String displayName = '';
  final _auth = FirebaseAuth.instance;
  UserModel? user;

  Future<String> getName(BuildContext context) async {
    String name = '';
    if (_auth.currentUser != null) {
      DocumentSnapshot user = await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid.toString())
          .get();
      name = user['lName'] + ' ' + user['fName'];
    }
    return name;
  }

  @override
  void initState() {
    super.initState();
    getName(context).then((String name) {
      setState(() {
        displayName = name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    getFoods(foodNotifier);
    //print(foodNotifier.foodList);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Welcome back, ' + displayName + '!',
            style: TextStyle(
              fontFamily: 'FSBold',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Container(
            width: SizeConfig.screenWidth! * 0.9,
            height: SizeConfig.screenWidth! * 0.12,
            child: TypeAheadField<FoodModel>(
              suggestionsCallback: (String query) async {
                print(query);

                return foodNotifier.foodList.where((food) {
                  final nameLower = food.name.toLowerCase();
                  final queryLower = query.toLowerCase();

                  return nameLower.contains(queryLower);
                }).toList();
              },
              itemBuilder: (context, FoodModel? suggestion) {
                final food = suggestion!;
                return ListTile(
                  leading: Image.network('${food.images}',
                      width: 35, fit: BoxFit.fitWidth),
                  title: Text(food.name),
                  subtitle: Text('${food.price}'),
                );
              },
              noItemsFoundBuilder: (context) => Container(
                height: SizeConfig.screenWidth! * 0.12,
                child: Center(
                  child: Text(
                    'No Food Found.',
                  ),
                ),
              ),
              onSuggestionSelected: (FoodModel? suggestion) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        FoodDetailScreen(idFood: suggestion!.idFood)));
              },
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'What do you want to order?',
                ),
              ),
            ),
          ),
        ),
        // SearchField(),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.02,
        ),
        BannerHome(),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FoodGroup(
                  foodName: 'Rice',
                  foodImg: 'assets/images/rice.png',
                  onPress: () {},
                ),
                FoodGroup(
                  foodName: 'Snacks',
                  foodImg: 'assets/images/snack.png',
                  onPress: () {},
                ),
                FoodGroup(
                  foodName: 'Noodle',
                  foodImg: 'assets/images/noodle.png',
                  onPress: () {},
                ),
                FoodGroup(
                  foodName: 'Pizza',
                  foodImg: 'assets/images/pizza.png',
                  onPress: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FoodGroup(
                  foodName: 'Hamburger',
                  foodImg: 'assets/images/hamburger.png',
                  onPress: () {},
                ),
                FoodGroup(
                  foodName: 'Sushi',
                  foodImg: 'assets/images/sushi.png',
                  onPress: () {},
                ),
                FoodGroup(
                  foodName: 'Chicken',
                  foodImg: 'assets/images/chicken.png',
                  onPress: () {},
                ),
                FoodGroup(
                  foodName: 'Beer',
                  foodImg: 'assets/images/beer.png',
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
        Divider(
          thickness: 4,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.14,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodFilterList.length,
              itemBuilder: (context, index) => FoodFilterCard(
                  filterName: foodFilterList[index]['name'],
                  filterImg: foodFilterList[index]['img'])),
        )
      ]),
    );
  }
}
