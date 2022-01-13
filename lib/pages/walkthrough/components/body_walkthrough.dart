import 'package:flutter/material.dart';
import 'package:ifood_user_app/SizeConfig.dart';
import 'package:ifood_user_app/pages/get_started/get_started_screen.dart';
import 'package:ifood_user_app/pages/walkthrough/components/walkthrough_content.dart';
import 'package:ifood_user_app/widgets/buttons/main_button.dart';

import '../../../constants.dart';

class BodyWalkthrough extends StatefulWidget {
  static String routeName = '/body_walkthrough';
  const BodyWalkthrough({Key? key}) : super(key: key);

  @override
  State<BodyWalkthrough> createState() => _BodyWalkthroughState();
}

class _BodyWalkthroughState extends State<BodyWalkthrough> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  List<Map<String, String>> walkthroughData = [
    {
      'image': 'assets/images/walkthrough1.svg',
      'title': 'Find Food You Love',
      'text':
          'Discover the best foods from over 1000 restaurants and fast delivery to your doorstep'
    },
    {
      'image': 'assets/images/walkthrough2.svg',
      'title': 'Live Tracking',
      'text':
          'Real time tracking of your food on the app once you placed the order'
    },
    {
      'image': 'assets/images/walkthrough3.svg',
      'title': 'Fast Delivery',
      'text': 'Fast food delivery to your home, offlice whenever you are'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: walkthroughData.length,
                  itemBuilder: (context, index) => WalkthroughContent(
                    title: walkthroughData[index]['title'],
                    text: walkthroughData[index]['text'],
                    image: walkthroughData[index]['image'],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        walkthroughData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    MainButton(
                        title: currentPage == 2 ? 'Get Started' : 'Next',
                        onPress: () {
                          setState(() {
                            if (currentPage < 3) {
                              currentPage = currentPage + 1;
                              _pageController.animateToPage(currentPage,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            }
                            if (currentPage > 2) {
                              currentPage = 2;
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  GetStartedScreen.routeName,
                                  (Route<dynamic> route) => false);
                            }
                          });
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: getProportionateScreenHeight(10),
      width: currentPage == index
          ? getProportionateScreenWidth(20)
          : getProportionateScreenWidth(10),
      decoration: BoxDecoration(
          color: currentPage == index ? mainColor : Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
