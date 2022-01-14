import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.name,
    required this.img,
    this.rating,
    required this.onPress,
    this.distance,
    this.time,
  }) : super(key: key);

  final String name;
  final String img;
  final double? rating;
  final double? distance;
  final int? time;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, left: 10),
                child: Image.network(
                  img,
                  width: 70,
                  height: 70,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 1.5,
                        height: 2),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                      ),
                      Text('$rating'),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * 0.05),
                        width: 3,
                        height: 20,
                        color: splitColor,
                      ),
                      Icon(Icons.location_on_outlined),
                      distance! < 500 ? Text('$distance km') : Text('>500 km'),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * 0.05),
                        width: 3,
                        height: 20,
                        color: splitColor,
                      ),
                      Icon(Icons.timer),
                      time! < 1000 ? Text('$time min') : Text('>999 min')
                    ],
                  )
                ],
              )
            ],
          ),
          Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
