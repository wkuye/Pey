import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/models/popularModel.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

class PopularGrid extends StatelessWidget {
  final Popular popular;
  final bool themeBool;
  final bool index;
  final ThemeData theme;
    final String discountPrice;
  const PopularGrid(
      {super.key,
      required this.popular,
      required this.themeBool,
      required this.theme, required this.index, required this.discountPrice});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Positioned(
              top: index?80: 60,
              child: Container(
                height:size.height  / 4.8,
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
                      popular.name,
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child:  popular.discount=='0.00'? Text(
                            popular.price,
                            style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ): Row(
                        children: [
                          Text(
                            popular.price,
                            style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                                                    const SizedBox(width: 4,),
                                                    
                          Container(
                            height: size.height/42,
                            width: size.width/12,
                            color: const Color(onBoardingButtonColor).withOpacity(0.4),
                            child: Center(
                              child: Text('-${double.parse(popular.discount).toInt()}%',style: const TextStyle(fontSize: 12),),
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
              top: index?25: 5,
              left: 7,
              child: CachedNetworkImage(
                  imageUrl: Platform.isAndroid
                      ? 'http://10.0.2.2:8000/${popular.image}'
                      : 'http://127.0.0.1:8000/${popular.image}',
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
