import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/api/bill_api.dart';
import 'package:ifood_user_app/models/bill_model.dart';
import 'package:ifood_user_app/notifier/bill_notifier.dart';
import 'package:ifood_user_app/pages/rating/rating_screen.dart';
import 'package:ifood_user_app/validators/sign_in_validator.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';
import 'package:provider/provider.dart';

class BodyBillDetail extends StatefulWidget {
  BodyBillDetail({Key? key, required this.billModel}) : super(key: key);
  final BillModel billModel;

  @override
  State<BodyBillDetail> createState() => _BodyBillDetailState();
}

class _BodyBillDetailState extends State<BodyBillDetail> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _commentController = TextEditingController();
  final _idOrderController = TextEditingController();

  String? err;
  initInfo() async {
    _idOrderController.text = widget.billModel.idBill.toString();
    _nameController.text = widget.billModel.name.toString();
    _phoneNumberController.text = widget.billModel.phoneNumber.toString();
    _locationController.text = widget.billModel.address.toString();
    _commentController.text = widget.billModel.comment.toString();
  }

  @override
  void initState() {
    initInfo();

    BillNotifier billNotifier =
        Provider.of<BillNotifier>(context, listen: false);
    getBills(billNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BillNotifier billNotifier = Provider.of<BillNotifier>(context);
    getBills(billNotifier);
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
                    child: buildIdTextField(),
                  ),
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
          widget.billModel.carts != null
              ? Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight! *
                      0.12 *
                      widget.billModel.carts!.length,
                  //color: Colors.amberAccent,
                  child: ListView.builder(
                      itemCount: widget.billModel.carts!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Image.network(
                                widget.billModel.carts![index].images,
                                width: 70,
                                fit: BoxFit.fitWidth),
                            title: Text(widget.billModel.carts![index].name),
                            subtitle: Text(
                                'x ${widget.billModel.carts![index].quantity}'),
                            trailing: Text(
                                '${widget.billModel.carts![index].price * widget.billModel.carts![index].quantity} đ'),
                          ),
                        );
                      }),
                )
              : Text('Null Value'),
          Text(
            'Sub Total: ${widget.billModel.subTotal} đ',
            style: TextStyle(fontSize: 17, height: 2),
          ),
          Text(
            'Shipping Fee: ${widget.billModel.shippingFee} đ',
            style: TextStyle(fontSize: 17, height: 2),
          ),
          Divider(
            height: 3,
            thickness: 1.5,
          ),
          Text(
            'Total: ${widget.billModel.total} đ',
            style:
                TextStyle(fontSize: 19, fontWeight: FontWeight.bold, height: 2),
          ),
          widget.billModel.status == 'received' &&
                  widget.billModel.isRating == false
              ? Center(
                  child: MainButton(
                      title: 'Rating',
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RatingScreen(
                                idBill: billNotifier.currentBill.idBill)));
                      }))
              : Container(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  TextFormField buildIdTextField() => TextFormField(
        controller: _idOrderController,
        enabled: false,
        onSaved: (value) {
          _nameController.text = value.toString();
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          labelText: 'ID Order',
        ),
      );
  TextFormField buildPhoneNumberTextField() => TextFormField(
        onSaved: (value) {
          _phoneNumberController.text = value!;
        },
        enabled: false,
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
        enabled: false,
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
        enabled: false,
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
        enabled: false,
        onSaved: (value) {
          _nameController.text = value.toString();
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          labelText: 'Comment',
        ),
      );
}
