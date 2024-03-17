import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pey_ltd_mobile/api/http_request/shopRequests.dart';
import 'package:pey_ltd_mobile/api/models/CategoryModel.dart';
import 'package:pey_ltd_mobile/screens/shop/category_pages/seeFull.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categoryList;
  final Size size;
  const CategoryList({super.key, required this.categoryList, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            final CategoryIndexes = categoryList[index];
            return CachedNetworkImage(
                width: size.width / 3,
                imageUrl: Platform.isAndroid
                    ? 'http://10.0.2.2:8000/${CategoryIndexes.image}'
                    : 'http://127.0.0.1:8000/${CategoryIndexes.image}',
                imageBuilder: (context, imageprovider) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: GestureDetector(
                        onTap: (){
                       if (index == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                           SeeFull(
                                                future: ShopRequests().getFirstCategory())));
                              } else if (index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SeeFull(
                                                future: ShopRequests().getSecondCategory())));
                              } else if (index == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SeeFull(
                                                future: ShopRequests().getThirdCategory())));
                              }
                              else if (index == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SeeFull(
                                                future: ShopRequests().getFourthCategory())));
                              }
else if (index == 4) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SeeFull(
                                                future: ShopRequests().getFifthCategory())));
                              }

                            },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: imageprovider, fit: BoxFit.cover),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${CategoryIndexes.name}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
          }),
    );
  }
}
