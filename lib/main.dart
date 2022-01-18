import 'package:flutter/material.dart';
import 'package:yogo/onboarding.dart';

import 'authentication.dart';
import 'splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/signup',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/onboarding': (context) => const OnBoardingScreen(),
          '/signup': (contex) => const AuthenticationPage()
        });
  }
}
