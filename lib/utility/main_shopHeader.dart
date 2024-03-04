import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

class MainShopHeader extends StatelessWidget {
  final ThemeData theme;
  const MainShopHeader({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Text(
              'Explore What',
              style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'All Your Needs',
              style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        const Spacer(flex: 4,),
        const Icon(Icons.notifications),
        const Spacer(),
        Image.asset(hamburger),
        const Spacer(),
      ],
    );
  }
}
