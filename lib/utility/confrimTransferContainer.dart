import 'package:flutter/material.dart';

class ConfrimContainer extends StatelessWidget {
  final String text;
  const ConfrimContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 8,
      width: size.width ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          Divider()
        ],
      ),
    );
  }
}
