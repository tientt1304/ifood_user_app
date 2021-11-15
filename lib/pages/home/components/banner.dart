import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/banner1.png',
  'assets/images/banner2.png',
  'assets/images/banner3.png',
];

class BannerHome extends StatelessWidget {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              //margin: EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Container()),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.8,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: imageSliders,
    ));
  }
}
