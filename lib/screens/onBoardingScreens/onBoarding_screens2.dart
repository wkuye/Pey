import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/utility/animatedPageRoute.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      final theme = AdaptiveTheme.of(context).theme.backgroundColor;
    final primaryColor = AdaptiveTheme.of(context).theme.primaryColor;
    final indicatorColor = AdaptiveTheme.of(context).theme.indicatorColor;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;
    return Container(
      height: size.height,
      width: size.width,
      decoration:
           BoxDecoration(color: theme, image: const DecorationImage(image: AssetImage(group))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            moon1,
            scale:Platform.isAndroid?1.5:  1.1,
          ),
         const SizedBox(height: 30,),
           Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  onboardingTextWallet,
                  style: TextStyle(color:indicatorColor),
                ),
              )),
           Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                onboardingText21,
                maxLines: 1,
                style: TextStyle(
                    color:primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                onboardingText22,
                maxLines: 1,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
           Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                onboardingText23,
                maxLines: 1,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: themeBool?Image.asset(sliderLight2): Image.asset(slider2),
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).push(boardingRoute2());
              },
              child: Image.asset(next2)),
          Row(children: [
            const Spacer(),
            Image.asset(
              moon2,
              scale:Platform.isAndroid?1.6:  1.22,
            ),
          ])
        ],
      ),
    );
  }
}
