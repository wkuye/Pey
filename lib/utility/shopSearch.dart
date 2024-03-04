import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

class ShopSearch extends StatelessWidget {
  final Size size;
  final ThemeData theme;
  final bool themeBool;
  const ShopSearch(
      {super.key,
      required this.size,
      required this.theme,
      required this.themeBool});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 15,
      width: size.width,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffBFBFBF)),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
        const SizedBox(width: 10,),
          Image.asset(search),
          const Spacer(),
          Text(
            'Chair,desk,lamp,etc',
            style:
                TextStyle(color: themeBool ? const Color(0xffBFBFBF) : Colors.white),
          ),
          const Spacer(flex: 6,),
          Image.asset(tabler),
          const Spacer()
        ],
      ),
    );
  }
}
