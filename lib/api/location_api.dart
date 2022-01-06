import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifood_user_app/models/location_model.dart';
import 'package:ifood_user_app/notifier/location_notifier.dart';

getLocations(LocationNotifier locationNotifier) async {
  final _authCurrentUser = FirebaseAuth.instance.currentUser;
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('users-cart-items')
      .doc(_authCurrentUser!.email)
      .collection('items')
      .get();
  List<LocationModel> _locationList = [];
  querySnapshot.docs.forEach((doc) {
    LocationModel cartModel = LocationModel.fromDocument(doc);
    _locationList.add(cartModel);
  });

  locationNotifier.locationList = _locationList;
}

addLocation(LocationNotifier locationNotifier) async {
  await getLocations(locationNotifier);
  bool isExist = false;

  // final _authCurrentUser = FirebaseAuth.instance.currentUser;
  // do here
  if (isExist == true) {
    //change quantity

  } else {
    //String idCart = (new DateTime.now().microsecondsSinceEpoch).toString();
  }
}
