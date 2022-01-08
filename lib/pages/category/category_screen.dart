import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/category/components/body_category.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = '/category';
  CategoryScreen({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    print(category);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.toTitleCase(),
          style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BodyCategory(
        category: this.category,
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
