import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      final theme = AdaptiveTheme.of(context).theme.backgroundColor;
    final primaryColor = AdaptiveTheme.of(context).theme.primaryColor;
    
    return Container(
      height: size.height,
      width: size.width,
      decoration:
           BoxDecoration(color: theme,image: const DecorationImage(image: AssetImage(group))),
      child: Stack(
        children: [
          Positioned(child: Image.asset(ellipse2)),
          Positioned(
              left: 20,
              top: 100,
              child: Image.asset(
                ellipse1,
                scale: 1.3,
              )),
          Positioned(right: 1, child: Image.asset(ellipse3)),
          Positioned(left: 80, child: Image.asset(ellipse4)),
           Positioned(
            bottom: size.height/2.5,
            left: 20,
            child: Material(
              type: MaterialType.transparency,
              child: Text(onBoardingText31,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            ),
          ),
           Positioned(
            bottom: size.height/3,
            left: 20,
            child:  Material(
              type: MaterialType.transparency,
              child: Text(onBoardingText32,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            ),
          ),
           Positioned(
            bottom: size.height /3.6,
            left: 20,
            child: Material(
              type: MaterialType.transparency,
              child: Text(onBoardingText33,
                  style: TextStyle(color: primaryColor ,fontSize: 13)),
            ),
          ),
          Positioned(
            bottom: size.height/3.9,
            left: 20,
            child:  Material(
              type: MaterialType.transparency,
              child: Text(onBoardingText34,
                  style: TextStyle(color: primaryColor, fontSize: 13)),
            ),
          ),
           Positioned(
            bottom: size.height/4.3,
            left: 20,
            child:  Material(
              type: MaterialType.transparency,
              child: Text(onBoardingText35,
                  style: TextStyle(color: primaryColor, fontSize: 13)),
            ),
          ),
           Positioned(
            bottom: size.height/4.8,
            left: 20,
            child:  Material(
              type: MaterialType.transparency,
              child: Text(onBoardingText36,
                  style: TextStyle(color: primaryColor, fontSize: 13)),
            ),
          ),
          Positioned(bottom: size.height/5.8, left: 20, child: Image.asset(slider3)),
          Positioned(
            bottom: size.height/16,
            left: 20,
              child: GestureDetector(
                onTap: () =>  Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            ),
                child: Container(
                          height: size.height / 17,
                          width: size.width / 4,
                          decoration:  BoxDecoration(color: const Color(onBoardingButtonColor,),borderRadius: BorderRadius.circular(8)),
                          child: const Material(type: MaterialType.transparency,child: Center(child: Text(getStarted,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),),
                        ),
              )),
            Positioned(
            bottom: size.height/18.5, 
            right: 20,
              child: Container(
            height: size.height / 17,
            width: size.width / 4,
            decoration:  BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(8)),
            child: const Material(type: MaterialType.transparency,child: Center(child: Text(skip,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),),
          )),
        ],
      ),
    );
  }
}
