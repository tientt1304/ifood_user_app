import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/api/bill_api.dart';
import 'package:ifood_user_app/api/cart_api.dart';
import 'package:ifood_user_app/api/notification_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_cart.dart';
import 'package:ifood_user_app/models/bill_model.dart';
import 'package:ifood_user_app/models/cart_model.dart';
import 'package:ifood_user_app/models/notification_model.dart';
import 'package:ifood_user_app/models/user_model.dart';
import 'package:ifood_user_app/notifier/bill_notifier.dart';
import 'package:ifood_user_app/notifier/cart_notifier.dart';
import 'package:ifood_user_app/notifier/notification_notifier.dart';
import 'package:ifood_user_app/pages/food_detail/food_detail_screen.dart';
import 'package:ifood_user_app/pages/success_screens/order_success_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:provider/provider.dart';

class BodyCheckOut extends StatefulWidget {
  BodyCheckOut({Key? key}) : super(key: key);

  @override
  State<BodyCheckOut> createState() => _BodyCheckOutState();
}

class _BodyCheckOutState extends State<BodyCheckOut> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _commentController = TextEditingController();

  String? err;

  UserModel userModel = new UserModel();
  String uid = '';
  final _auth = FirebaseAuth.instance;
  CartFB cartFB = new CartFB();
  num subTotal = 0;
  BillModel billModel = new BillModel();
  Future<String> getUid(BuildContext context) async {
    String uid = '';
    if (_auth.currentUser != null) {
      uid = _auth.currentUser!.uid;
    }
    return uid;
  }

  Future<UserModel> getUserModel(BuildContext context) async {
    var uid = await getUid(context);
    if (_auth.currentUser != null) {
      var doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      userModel = UserModel.fromDocument(doc);
    }
    return userModel;
  }

  getDataCart(CartNotifier cartNotifier) async {
    getCarts(cartNotifier);
    subTotal = await cartNotifier.total();
    return subTotal;
  }

  initInfo() async {
    await getUserModel(context);
    _nameController.text =
        userModel.fName.toString() + ' ' + userModel.lName.toString();
    _phoneNumberController.text = userModel.phoneNumber.toString();
    _locationController.text =
        userModel.latitude.toString() + ', ' + userModel.longitude.toString();
  }

  @override
  void initState() {
    super.initState();
    CartNotifier cartNotifier =
        Provider.of<CartNotifier>(context, listen: false);
    getDataCart(cartNotifier);
    getUid(context).then((value) {
      uid = value;
    });
    getUserModel(context);
    initInfo();
  }

  @override
  Widget build(BuildContext context) {
    CartNotifier cartNotifier = Provider.of<CartNotifier>(context);
    NotificationNotifier notificationNotifier =
        Provider.of<NotificationNotifier>(context);
    _onCartDeleted(CartModel cartModel) {
      cartNotifier.deleteCart(cartModel);
    }

    BillNotifier billNotifier = Provider.of<BillNotifier>(context);
    billAdded(BillModel billModel) {
      billNotifier.addBill(billModel);
    }

    notiAdded(NotificationModel noti) {
      notificationNotifier.addNoti(noti);
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth! * 0.06,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.screenHeight! * 0.01),
                    child: buildNameTextField(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.screenHeight! * 0.01),
                    child: buildPhoneNumberTextField(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.screenHeight! * 0.01),
                    child: buildLocationTextField(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.screenHeight! * 0.01),
                    child: buildCommentTextField(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight! * 0.12 * cartNotifier.carts.length,
            child: ListView.builder(
                itemCount: cartNotifier.carts.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              deleteCart(
                                  cartNotifier.carts[index], _onCartDeleted);
                            });

                            Fluttertoast.showToast(
                                msg: 'Delete food successful');
                          },
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FoodDetailScreen(
                                idFood: cartNotifier.carts[index].idFood)));
                      },
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          leading: Image.network(
                              cartNotifier.carts[index].images,
                              width: 70,
                              fit: BoxFit.fitWidth),
                          title: Text(cartNotifier.carts[index].name),
                          subtitle:
                              Text('x ${cartNotifier.carts[index].quantity}'),
                          trailing: Text(
                              '${cartNotifier.carts[index].price * cartNotifier.carts[index].quantity} đ'),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Text(
            'Sub Total: $subTotal đ',
            style: TextStyle(fontSize: 17, height: 2),
          ),
          Text(
            'Shipping Fee: 15000 đ',
            style: TextStyle(fontSize: 17, height: 2),
          ),
          Divider(
            height: 3,
            thickness: 1.5,
          ),
          Text(
            'Total: ${subTotal + 15000} đ',
            style:
                TextStyle(fontSize: 19, fontWeight: FontWeight.bold, height: 2),
          ),
          Center(
              child: MainButton(
                  title: 'Place Order',
                  onPress: () {
                    _onPress(billModel, billAdded, notiAdded, cartNotifier);
                  }))
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() => TextFormField(
        onSaved: (value) {
          _phoneNumberController.text = value!;
        },
        controller: _phoneNumberController,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value != null && !phoneNumberValidatorRegExp.hasMatch(value)) {
            return kInvalidPhoneNummberError;
          } else if (value == null || value.isEmpty) {
            return kPhoneNumberNullError;
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Phone Number',
        ),
      );
  TextFormField buildNameTextField() => TextFormField(
        controller: _nameController,
        onSaved: (value) {
          _nameController.text = value.toString();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Personal Detail',
        ),
      );
  TextFormField buildLocationTextField() => TextFormField(
        controller: _locationController,
        onSaved: (value) {
          _nameController.text = value.toString();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kNamelNullError;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Delivery Address',
        ),
      );
  TextFormField buildCommentTextField() => TextFormField(
        controller: _commentController,
        onSaved: (value) {
          _nameController.text = value.toString();
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          labelText: 'Comment',
        ),
      );
  void _onPress(BillModel billModel, Function billAdded, Function notiAdded,
      CartNotifier cartNotifier) async {
    if (_formKey.currentState!.validate()) {
      try {
        String idBill = (new DateTime.now().microsecondsSinceEpoch).toString();
        billModel.idBill = idBill;
        billModel.subTotal = subTotal;
        billModel.shippingFee = 15000;
        billModel.total = subTotal + billModel.shippingFee;
        billModel.uid = uid;
        billModel.email = _auth.currentUser!.email;
        billModel.name = _nameController.text.toString();
        billModel.phoneNumber = _phoneNumberController.text.toString();
        billModel.comment = _commentController.text.toString();
        billModel.latitude =
            _locationController.text.toString().trim().split(', ')[0];
        billModel.longitude =
            _locationController.text.toString().trim().split(', ')[1];
        billModel.status = 'on-going';
        billModel.itemCount = cartNotifier.countItems();

        billModel.carts = cartNotifier.carts;

        addBill(billModel, billAdded, cartNotifier);
        deleteAllCart(cartNotifier);
        addNotification(billModel.idBill, notiAdded, 'ordered');
        Navigator.pushNamedAndRemoveUntil(
            context, OrderSuccessScreen.routeName, (route) => false);
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            err = "Your email address appears to be malformed.";
            break;
          case "user-not-found":
            err = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            err = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            err = "Too many requests";
            break;
          case "operation-not-allowed":
            err = "Signing in with Email and Password is not enabled.";
            break;
          default:
            err = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: err!);
      }
    }
  }
}
