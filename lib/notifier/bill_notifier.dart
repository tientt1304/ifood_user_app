import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/models/bill_model.dart';

class BillNotifier with ChangeNotifier {
  List<BillModel> _billList = [];
  BillModel? _currentBill;

  UnmodifiableListView<BillModel> get billList =>
      UnmodifiableListView(_billList);

  BillModel get currentBill => _currentBill!;
  set billList(List<BillModel> billList) {
    _billList = billList;
    notifyListeners();
  }

  set currentBill(BillModel currentBill) {
    _currentBill = currentBill;
    notifyListeners();
  }

  addBill(BillModel billModel) {
    _billList.add(billModel);
    notifyListeners();
  }
}
