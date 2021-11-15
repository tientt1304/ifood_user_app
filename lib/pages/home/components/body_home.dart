import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';

import 'package:ifood_user_app/pages/home/components/body_home_split.dart';
import 'package:ifood_user_app/pages/home/components/restaurant_card.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  List<Map<String, dynamic>> restaurantList = [
    {
      'name': 'Trà sữa Toocha - Dân Chủ Bình Thọ',
      'img': 'assets/images/toocha.png',
      'rating': 4.7,
      'distance': 1.7,
      'time': '17 phút',
      'onPress': () {}
    },
    {
      'name': 'Trà sữa Toocha - Dân Chủ Bình Thọ',
      'img': 'assets/images/toocha.png',
      'rating': 4.7,
      'distance': 1.7,
      'time': '17 phút',
    },
    {
      'name': 'Trà sữa Toocha - Dân Chủ Bình Thọ',
      'img': 'assets/images/toocha.png',
      'rating': 4.7,
      'distance': 1.7,
      'time': '17 phút',
    },
    {
      'name': 'Trà sữa Toocha - Dân Chủ Bình Thọ',
      'img': 'assets/images/toocha.png',
      'rating': 4.7,
      'distance': 1.7,
      'time': '17 phút',
    },
    {
      'name': 'Trà sữa Toocha - Dân Chủ Bình Thọ',
      'img': 'assets/images/toocha.png',
      'rating': 4.7,
      'distance': 1.7,
      'time': '17 phút',
    },
    {
      'name': 'Trà sữa Toocha - Dân Chủ Bình Thọ',
      'img': 'assets/images/toocha.png',
      'rating': 4.7,
      'distance': 1.7,
      'time': '17 phút',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScrolled) => [
            SliverAppBar(
              collapsedHeight: SizeConfig.screenHeight! * 0.79,
              expandedHeight: SizeConfig.screenHeight! * 0.79,
              flexibleSpace: BodyHomeSplit(),
            ),
            SliverPersistentHeader(
                delegate: MyDelegate(
                  TabBar(
                      tabs: [
                        Tab(text: 'Nearby'),
                        Tab(text: 'Top Salses'),
                        Tab(text: 'Best Rate')
                      ],
                      indicatorColor: primaryColor,
                      unselectedLabelColor: secondaryColor,
                      labelColor: primaryColor),
                ),
                floating: true,
                pinned: true)
          ],
          body: TabBarView(
            children: [1, 2, 3]
                .map(
                  (e) => ListView.builder(
                      itemCount: restaurantList.length,
                      itemBuilder: (context, index) {
                        return RestaurantCard(
                          name: restaurantList[index]['name'],
                          img: restaurantList[index]['img'],
                          rating: restaurantList[index]['rating'],
                          distance: restaurantList[index]['distance'],
                          time: restaurantList[index]['time'],
                        );
                      }),
                )
                .toList(),
          ),
        ),
      )),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
