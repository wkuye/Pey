// ignore: file_names
import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/utility/animatedPageRoute.dart';

import '../constant/strings.dart';

class AnimatedBoarding extends StatefulWidget {
  const AnimatedBoarding({super.key});

  @override
  State<AnimatedBoarding> createState() => _AnimatedBoardingState();
}

class _AnimatedBoardingState extends State<AnimatedBoarding> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
        Navigator.of(context).push(createRoute());
    });
  
    super.initState();
  }

  @override
Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final theme = AdaptiveTheme.of(context).theme.backgroundColor;
    return Container(
      height: size.height,
      width: size.width,
      decoration:  BoxDecoration(color: theme),
      child: Stack(
        children: [
          Positioned(
              bottom: size.height / 7,
              child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                      sigmaX: 1, sigmaY: 6, tileMode: TileMode.decal),
                  child: Image.asset(recRight))),
          Positioned(
              left: 230,
              top: size.height / 8,
              child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                      sigmaX: 1, sigmaY: 10, tileMode: TileMode.decal),
                  child: Image.asset(recLeft))),
          Positioned(
              top: size.height / 2.5, left: 150, child: Image.asset(pey)),
          Positioned(
              bottom: size.height / 9,
              left: size.width / 12,
              width: size.width / 1.2,
              child: const LinearProgressIndicator(color: Color(progressBarColor),backgroundColor: Color(progressBarColor),))
        ],
      ),
    );
  }
}
