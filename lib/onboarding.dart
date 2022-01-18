import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            PageView(
              onPageChanged: _onPageChanged,
              children: [
                onBoardingPage(
                    "assets/images/Layer 1onboarding.png",
                    "Discover",
                    "Find inspiration, explore fascinating destinations from YOGO."),
                onBoardingPage(
                    "assets/images/Layer 2onboarding.png",
                    "Plan your trip",
                    "Select destinations and start scheduling details for your trip."),
                onBoardingPage(
                    "assets/images/Layer 3onboarding.png",
                    "Manage trip expense",
                    "Manage budgets and expenses throughout your journey."),
                onBoardingPage(
                    "assets/images/Layer 4onboarding.png",
                    "Start your adventure",
                    "Enjoy! Relax and chilling memories."),
                onBoardingPage(
                    "assets/images/Layer 5onboarding.png",
                    "Share and connect",
                    "Share your experiences on the trip and connect with travel lovers around the world.")
              ],
            ),
            const SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 20, 0),
                  child: Text(
                    'skip',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SizedBox(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pageNode(active: currentPage == 0),
                        pageNode(active: currentPage == 1),
                        pageNode(active: currentPage == 2),
                        pageNode(active: currentPage == 3),
                        pageNode(active: currentPage == 4)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget onBoardingPage(String imagePath, String title, String description) {
    return Column(
      children: [
        Image(image: AssetImage(imagePath)),
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            width: 300,
            child: Text(
              description,
              style: const TextStyle(color: Colors.black45),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget pageNode({bool active = false}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          width: 8,
          height: active ? 4 : 2,
          decoration: BoxDecoration(
              color: active ? Colors.black54 : Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(active ? 2 : 1)))),
    );
  }

  void _onPageChanged(int value) {
    setState(() {
      currentPage = value;
    });
  }
}
