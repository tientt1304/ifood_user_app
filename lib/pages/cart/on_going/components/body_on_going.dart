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
      child: ListView.builder(
        itemCount: billNotifier.billList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                print('ulatr');
              },
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ficons%2Fdelivery-man.png?alt=media&token=9ff53485-2b9d-4d9d-adf7-f64465434cce',
                      width: 70,
                      fit: BoxFit.fitWidth),
                  title: Text(
                      'Order ${billNotifier.billList[index].idBill} is ${billNotifier.billList[index].status}'),
                  subtitle: Text(
                      '${billNotifier.billList[index].total}đ (${billNotifier.billList[index].itemCount} items)'),
                  trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Received',
                      ),
                      style: ElevatedButton.styleFrom(primary: primaryColor)),
                ),
              ));
        },
      ),
    );
  }
}
