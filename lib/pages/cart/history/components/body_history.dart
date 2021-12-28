import 'package:flutter/material.dart';
import 'package:ifood_user_app/api/bill_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/notifier/bill_notifier.dart';
import 'package:provider/provider.dart';

class BodyHistory extends StatefulWidget {
  const BodyHistory({Key? key}) : super(key: key);

  @override
  State<BodyHistory> createState() => _BodyHistoryState();
}

class _BodyHistoryState extends State<BodyHistory> {
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
          return billNotifier.billList[index].status == 'received'
              ? GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ifood-6cabb.appspot.com/o/source_images%2Ficons%2Fdelivered.png?alt=media&token=17f0f62a-ba6f-4133-97f6-c168b249a0af',
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
                      trailing: billNotifier.billList[index].isRating == false
                          ? ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Rating',
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                              ))
                          : Icon(Icons.done),
                    ),
                  ))
              : Container();
        },
      ),
    );
  }
}
