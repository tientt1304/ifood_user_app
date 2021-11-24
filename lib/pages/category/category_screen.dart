import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/pages/category/components/body_category.dart';

import '../../SizeConfig.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = '/CategoryScreen';
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
         title: Text('Category', style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold), ),
         centerTitle: true,
      ),
      body: BodyCategory(),
    );
  }
}