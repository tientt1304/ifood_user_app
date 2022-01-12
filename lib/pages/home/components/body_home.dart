import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/api/restaurant_api.dart';
import 'package:ifood_user_app/constants.dart';
import 'package:ifood_user_app/firebase/fb_restaurant.dart';
import 'package:ifood_user_app/notifier/restaurant_notifier.dart';
import 'package:ifood_user_app/pages/home/components/body_home_split.dart';
import 'package:ifood_user_app/pages/home/components/restaurant_card.dart';
import 'package:ifood_user_app/pages/restaurant_detail/restaurant_detail_screen.dart';
import 'package:provider/provider.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  Position? _currentUserPosition;
  getCurrentLocation() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context, listen: false);
    getRestaurants(restaurantNotifier);
    getBestRateRestaurants(restaurantNotifier);
    getCurrentLocation();
    super.initState();
  }

  RestaurantFB restaurantFB = new RestaurantFB();
  @override
  Widget build(BuildContext context) {
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    List<Widget> _views = [
      ListView.builder(
        //shrinkWrap: true,
        itemCount: restaurantNotifier.restaurantList.length,
        itemBuilder: (context, index) {
          return RestaurantCard(
            name: restaurantNotifier.restaurantList[index].name,
            img: restaurantNotifier.restaurantList[index].logo,
            rating: restaurantNotifier.restaurantList[index].rating,
            distance: restaurantNotifier.restaurantList[index].distance,
            time: restaurantNotifier.restaurantList[index].time,
            onPress: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RestaurantDetailScreen(
                        idRestaurant: restaurantNotifier
                            .restaurantList[index].idRestaurant,
                        distance:
                            restaurantNotifier.restaurantList[index].distance,
                      )));
            },
          );
        },
      ),
      ListView.builder(
        //shrinkWrap: true,
        itemCount: restaurantNotifier.restaurantBestRateList.length,
        itemBuilder: (context, index) {
          return RestaurantCard(
            name: restaurantNotifier.restaurantBestRateList[index].name,
            img: restaurantNotifier.restaurantBestRateList[index].logo,
            rating: restaurantNotifier.restaurantBestRateList[index].rating,
            distance: restaurantNotifier.restaurantBestRateList[index].distance,
            time: restaurantNotifier.restaurantBestRateList[index].time,
            onPress: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RestaurantDetailScreen(
                        idRestaurant: restaurantNotifier
                            .restaurantBestRateList[index].idRestaurant,
                        distance: restaurantNotifier
                            .restaurantBestRateList[index].distance,
                      )));
            },
          );
        },
      ),
      ListView.builder(
        //shrinkWrap: true,
        itemCount: restaurantNotifier.restaurantList.length,
        itemBuilder: (context, index) {
          print(restaurantNotifier.restaurantList.length);
          return RestaurantCard(
            name: restaurantNotifier.restaurantList[index].name,
            img: restaurantNotifier.restaurantList[index].logo,
            rating: restaurantNotifier.restaurantList[index].rating,
            distance: restaurantNotifier.restaurantList[index].distance,
            time: restaurantNotifier.restaurantList[index].time,
            onPress: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RestaurantDetailScreen(
                        idRestaurant: restaurantNotifier
                            .restaurantList[index].idRestaurant,
                        distance:
                            restaurantNotifier.restaurantList[index].distance,
                      )));
            },
          );
        },
      ),
    ];

    double? distance = 0.0; // km
    int? time = 0; //minute

    Future<double?> _getDistance(
        double retaurantLatitude, double restaurantLongitude) async {
      distance = Geolocator.distanceBetween(
              _currentUserPosition!.latitude,
              _currentUserPosition!.longitude,
              retaurantLatitude,
              restaurantLongitude) /
          1000;
      distance = double.parse(distance!.toStringAsFixed(1));
      return distance;
    }

    restaurantNotifier.restaurantList.forEach((restaurant) async {
      _getDistance(double?.parse(restaurant.latitude!),
          double?.parse(restaurant.longitude!));
      restaurant.distance = distance;
    });
    restaurantNotifier.restaurantList
        .sort((a, b) => a.distance!.compareTo(b.distance!));
    restaurantNotifier.restaurantBestRateList.forEach((restaurant) async {
      _getDistance(double?.parse(restaurant.latitude!),
          double?.parse(restaurant.longitude!));
      restaurant.distance = distance;
    });
    _getTime(double? distance) {
      double? t = distance! * 2;
      time = t.toInt();
      return time;
    }

    restaurantNotifier.restaurantList.forEach((restaurant) async {
      restaurant.time = _getTime(restaurant.distance);
    });
    restaurantNotifier.restaurantBestRateList.forEach((restaurant) async {
      restaurant.time = _getTime(restaurant.distance);
    });
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
                        Tab(text: 'Best Rate'),
                        Tab(text: 'Top Salses'),
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
