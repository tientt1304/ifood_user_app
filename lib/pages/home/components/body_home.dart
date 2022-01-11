import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_restaurant.dart';
import 'package:ifood_user_app/models/restaurant_model.dart';
import 'package:ifood_user_app/pages/home/components/body_home_split.dart';
import 'package:ifood_user_app/pages/home/components/restaurant_card.dart';
import 'package:ifood_user_app/pages/restaurant_detail/restaurant_detail_screen.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  RestaurantFB restaurantFB = new RestaurantFB();
  @override
  Widget build(BuildContext context) {
    List<Widget> _views = [
      StreamBuilder(
          stream: restaurantFB.collectionReference.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[index];
                  RestaurantModel restaurantModel =
                      RestaurantModel.fromDocument(x);
                  return RestaurantCard(
                    name: restaurantModel.name,
                    img: restaurantModel.logo,
                    rating: restaurantModel.rating,
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestaurantDetailScreen(
                              idRestaurant: restaurantModel.idRestaurant)));
                    },
                  );
                },
              );
            }
          }),
      StreamBuilder(
          stream: restaurantFB.collectionReference.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[index];
                  RestaurantModel restaurantModel =
                      RestaurantModel.fromDocument(x);
                  return RestaurantCard(
                    name: restaurantModel.name,
                    img: restaurantModel.logo,
                    rating: restaurantModel.rating,
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestaurantDetailScreen(
                              idRestaurant: restaurantModel.idRestaurant)));
                    },
                  );
                },
              );
            }
          }),
      StreamBuilder(
          stream: restaurantFB.collectionReference
              .orderBy('rating', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[index];
                  RestaurantModel restaurantModel =
                      RestaurantModel.fromDocument(x);
                  return RestaurantCard(
                    name: restaurantModel.name,
                    img: restaurantModel.logo,
                    rating: restaurantModel.rating,
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestaurantDetailScreen(
                              idRestaurant: restaurantModel.idRestaurant)));
                    },
                  );
                },
              );
            }
          }),
    ];
    return SafeArea(
      child: Scaffold(
          body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScrolled) => [
            SliverAppBar(
              collapsedHeight: SizeConfig.screenHeight! * 0.82,
              expandedHeight: SizeConfig.screenHeight! * 0.8,
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
            children: _views,
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
