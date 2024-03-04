import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),backgroundColor: Color(onBoardingButtonColor),));
}
