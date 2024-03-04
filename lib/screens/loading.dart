import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/bloc/splash_Bloc.dart';
import 'package:pey_ltd_mobile/classes/splash_event.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/utility/custom_progress_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AdaptiveTheme.of(context).theme.backgroundColor;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(color: theme),
      child: Stack(
        children: [
          Positioned(bottom: size.height / 7, child: Image.asset(recRight)),
          Positioned(
              left: 240, top: size.height / 8, child: Image.asset(recLeft)),
          Positioned(
              top: size.height / 2.5, left: 150, child: Image.asset(pey)),
          Positioned(
              bottom: size.height / 9,
              left: size.width / 12,
              width: size.width / 1.2,
              child: LinearProgressIndicatorWithColorChange(
                totalDuration: const Duration(seconds: 4),
                halfwayCallback: () {
                  context.read<SplashBloc>().add(Blur());
                },
                color: const Color(progressBarColor),
                backgroundColor: const Color(progressBarBackgroundColor),
              ))
        ],
      ),
    );
  }
}
