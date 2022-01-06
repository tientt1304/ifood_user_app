import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:ifood_user_app/models/location_model.dart';

class LocationNotifier with ChangeNotifier {
  List<LocationModel> _locationList = [];
  LocationModel? _currentLocation;
  UnmodifiableListView<LocationModel> get locationList =>
      UnmodifiableListView(_locationList);

  LocationModel get currentLocation => _currentLocation!;

  set locationList(List<LocationModel> locationList) {
    _locationList = locationList;
    notifyListeners();
  }

  set currentLocation(LocationModel currentLocation) {
    _currentLocation = currentLocation;
    notifyListeners();
  }
}
