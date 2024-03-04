import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

import '../bloc/splash_Bloc.dart';
import '../classes/splash_event.dart';
import '../utility/custom_progress_indicator.dart';

class BlurrWidget extends StatefulWidget {
  const BlurrWidget({super.key});

  @override
  State<BlurrWidget> createState() => _BlurrWidgetState();
  
}

class _BlurrWidgetState extends State<BlurrWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final theme = AdaptiveTheme.of(context).theme.backgroundColor;
    return Container(
      height: size.height,
      width: size.width,
      decoration:  BoxDecoration(color:theme),
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
              child: BlurLinearProgressIndicatorWithColorChange(
                totalDuration: const Duration(seconds: 3),
                halfwayCallback: () {
                
                 context.read<SplashBloc>().add(Done());
                },
                color: const Color(progressBarColor),
                backgroundColor: const Color(progressBarBackgroundColor),
              ))
        ],
      ),
    );
  }
}
