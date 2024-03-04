import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/bloc/splash_Bloc.dart';
import 'package:pey_ltd_mobile/classes/%20splash_state.dart';
import 'package:pey_ltd_mobile/screens/animatedBoarding_screen.dart';
import 'package:pey_ltd_mobile/screens/blur.dart';
import 'package:pey_ltd_mobile/screens/loading.dart';
// ignore: unused_import
import 'package:pey_ltd_mobile/utility/animatedPageRoute.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      if (state.loading) {
        return const Loading();
      } else if (state.isDone) {
       return const AnimatedBoarding();
      } else if (state.isBlur) {
        return const BlurrWidget();
      } else {
        return Container();
      }
    });
  }
}
