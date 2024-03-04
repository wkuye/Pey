import 'package:flutter/material.dart';

import 'package:pey_ltd_mobile/screens/shop/main_shop.dart';
import 'package:pey_ltd_mobile/screens/shop/newUsersShop.dart';

class Shop extends StatefulWidget {
  const Shop({super.key, required this.boolpref});
  final bool? boolpref;

  @override
  State<Shop> createState() => _SHOPState();
}

class _SHOPState extends State<Shop> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {
    return widget.boolpref != null ? const MyShop() : const NewUserShop();
  }

}
