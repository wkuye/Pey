import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SubCategoryContainer extends StatelessWidget {
  final Size size;
  final String image;
  final ThemeData theme;
  final String name;
  final String description1;
  final String description2;
  const SubCategoryContainer(
      {super.key,
      required this.size,
      required this.image,
      required this.name,
      required this.description1,
      required this.description2, required this.theme});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        width: size.width / 3,
        imageUrl: Platform.isAndroid
            ? 'http://10.0.2.2:8000/$image'
            : 'http://127.0.0.1:8000/$image',
        imageBuilder: (context, imageprovider) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: imageprovider, fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description1,
                    style: const TextStyle(
                        color: Color(0xff4F5471), fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        description2,
                        style: const TextStyle(
                            color: Color(0xff4F5471),
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'off',
                        style: TextStyle(
                            color: Color(0xff4F5471),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    '$name ->',
                    style: const TextStyle(
                        color: Color(0xff4F5471),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )));
  }
}
