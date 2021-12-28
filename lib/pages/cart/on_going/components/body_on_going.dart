import 'package:flutter/material.dart';
import 'package:ifood_user_app/api/bill_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/notifier/bill_notifier.dart';
import 'package:provider/provider.dart';

class BodyOnGoing extends StatefulWidget {
  const BodyOnGoing({Key? key}) : super(key: key);

  @override
  State<BodyOnGoing> createState() => _BodyOnGoingState();
}

class _BodyOnGoingState extends State<BodyOnGoing> {
  @override
  void initState() {
    BillNotifier billNotifier =
        Provider.of<BillNotifier>(context, listen: false);
    getBills(billNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BillNotifier billNotifier = Provider.of<BillNotifier>(context);
    getBills(billNotifier);
    Future<void> _refreshList() async {
      getBills(billNotifier);
      print('refresh');
    }

    return RefreshIndicator(
      onRefresh: _refreshList,
      color: primaryColor,
      child: ListView.builder(
        itemCount: billNotifier.billList.length,
        itemBuilder: (context, index) {
          return billNotifier.billList[index].status == 'on-going'
              ? GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ficons%2Fdelivery-man.png?alt=media&token=9ff53485-2b9d-4d9d-adf7-f64465434cce',
                          width: 50,
                          fit: BoxFit.fitWidth),
                      title: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(text: 'Order '),
                            TextSpan(
                                text: '${billNotifier.billList[index].idBill} ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor)),
                          ],
                        ),
                      ),
                      subtitle: Text(
                          '${billNotifier.billList[index].total}đ (${billNotifier.billList[index].itemCount} items)'),
                      trailing: ElevatedButton(
                          onPressed: () {
                            checkReceivedBill(billNotifier.billList[index]);
                          },
                          child: Text(
                            'Delivered',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                          )),
                    ),
                  ))
              : Container();
        },
      ),
    );
  }
}
