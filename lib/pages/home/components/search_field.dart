// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:ifood_user_app/SizeConfig.dart';
// import 'package:ifood_user_app/constants.dart';
// import 'package:ifood_user_app/models/food_model.dart';
// import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';

// class SearchField extends StatefulWidget {
//   SearchField({
//     Key? key, required this.foodList
//   }) : super(key: key);
//   List<FoodModel> foodList;
//   @override
//   State<SearchField> createState() => _SearchFieldState();
// }

// class _SearchFieldState extends State<SearchField> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: SizeConfig.screenWidth! * 0.9,
//         height: SizeConfig.screenWidth! * 0.12,
//         child: TypeAheadField<FoodModel>(
//           suggestionsCallback: (String query) async {
//             return widget.foodList.where((food) {
//               final nameLower = food.name.toLowerCase();
//               final queryLower = query.toLowerCase();

//               return nameLower.contains(queryLower);
//             }).toList();
//           },
//           itemBuilder: (context, FoodModel? suggestion) {
//             final food = suggestion!;
//             return ListTile(
//               leading: Image.network('${food.images}',
//                   width: 35, fit: BoxFit.fitWidth),
//               title: Text(food.name),
//               subtitle: Text('${food.price}'),
//             );
//           },
//           noItemsFoundBuilder: (context) => Container(
//             height: SizeConfig.screenWidth! * 0.12,
//             child: Center(
//               child: Text(
//                 'No Food Found.',
//               ),
//             ),
//           ),
//           onSuggestionSelected: (FoodModel? suggestion) {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) =>
//                     FoodDetailScreen(idFood: suggestion!.idFood)));
//           },
//           textFieldConfiguration: TextFieldConfiguration(
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: primaryColor,
//               ),
//               border: OutlineInputBorder(),
//               hintText: 'What do you want to order?',
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
