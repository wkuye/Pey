import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/utility/animatedPageRoute.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AdaptiveTheme.of(context).theme.backgroundColor;
    final indicatorColor = AdaptiveTheme.of(context).theme.indicatorColor;
    final primaryColor = AdaptiveTheme.of(context).theme.primaryColor;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          color: theme,
          image:
              DecorationImage(image: AssetImage(themeBool ? group2 : group))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          themeBool
              ? Stack(
                  children: [
                    Positioned(
                        child: Image.asset(
                      ellipse76,
                      scale: 1.5,
                    )),
                    Positioned(
                        width: 210,
                        child: Image.asset(
                          ellipse77,
                          scale: 1.5,
                        )),
                    Positioned(
                        width: 190,
                        child: Image.asset(
                          group3,
                          scale: 1.5,
                        ))
                  ],
                )
              : Image.asset(
                  butterfly,
                  scale: 1.5,
                ),
          const Spacer(),
          Material(
              type: MaterialType.transparency,
              child: Text(
                onboardingTextWallet,
                style: TextStyle(color: indicatorColor),
              )),
          Material(
            type: MaterialType.transparency,
            child: Text(
              onboardingText11,
              maxLines: 1,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: Text(
              onboardingText12,
              maxLines: 1,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: Text(
              onboardingText13,
              maxLines: 1,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          themeBool ? Image.asset(sliderLight1) : Image.asset(slider),
          const Spacer(),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).push(boardingRoute1());
              },
              child: Image.asset(next)),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
