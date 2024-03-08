import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/models/itemModel.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

class ItemGrid extends StatelessWidget {
  final item items;
  final bool themeBool;
  final bool index;
  final String discountPrice;
  final ThemeData theme;
  const ItemGrid(
      {super.key,
      required this.items,
      required this.themeBool,
      required this.index,
      required this.theme, required this.discountPrice});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Positioned(
              top: index ? 80 : 60,
              child: Container(
                height: size.height / 4.8,
                width: size.width / 2.46,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: themeBool ? Colors.white : const Color(0xff35383F),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(
                      flex: 15,
                    ),
                    Text(
                      items.name,
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text(
                            items.price,
                            style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 4,),
                          Container(
                            height: size.height/42,
                            width: size.width/12,
                            color: const Color(onBoardingButtonColor).withOpacity(0.4),
                            child: Center(
                              child: Text('-${double.parse(items.discounted_price).toInt()}%',style: const TextStyle(fontSize: 12),),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            discountPrice.toString(),
                            style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: index ? 25 : 5,
              left: 7,
              child: CachedNetworkImage(
                  imageUrl: Platform.isAndroid
                      ? 'http://10.0.2.2:8000/${items.image}'
                      : 'http://127.0.0.1:8000/${items.image}',
                  imageBuilder: (context, imageprovider) => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          height: size.height / 5,
                          width: size.width / 2.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: imageprovider, fit: BoxFit.cover),
                          ),
                        ),
                      ))),
        ],
      ),
    );
  }
}
