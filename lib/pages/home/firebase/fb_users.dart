import 'package:cloud_firestore/cloud_firestore.dart';

class UsersFB {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
}
