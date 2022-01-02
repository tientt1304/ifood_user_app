import 'package:flutter/material.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/models/bill_model.dart';
import 'package:ifood_user_app/pages/bill_detail/components/body_bill_detail.dart';

class BillDetailScreen extends StatelessWidget {
  const BillDetailScreen({Key? key, required this.billModel}) : super(key: key);
  final BillModel billModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: 21,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Detail Bill',
              style: TextStyle(
                  color: kTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FSSemiBold')),
          centerTitle: true,
        ),
        body: BodyBillDetail(
          billModel: billModel,
        ));
  }
}
