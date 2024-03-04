import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/pages/onBoarding_page.dart';
import 'package:pey_ltd_mobile/screens/onBoardingScreens/onBoarding_screens2.dart';

import '../screens/onBoardingScreens/onBoarding_screen3.dart';

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const OnBoarding(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route boardingRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const OnBoardingScreen2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.fastOutSlowIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve..flipped));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


Route boardingRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const OnBoardingScreen3(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.fastOutSlowIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve..flipped));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

