import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/http_request/get_popularRequest.dart';
import 'package:pey_ltd_mobile/api/models/popularModel.dart';
import 'package:pey_ltd_mobile/utility/popular_grid.dart';

class Furniture extends StatelessWidget {
   final bool themeBool;
  final ThemeData themeData;
  final ScrollController controller;
  const Furniture({super.key, required this.themeBool, required this.themeData, required this.controller});

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: PopularRequest().getAllFurniture(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var popularLists = snapshot.data;
            List<Popular> popularList =
                popularLists!.map((json) => Popular.fromJson(json)).toList();
          
            return    GridView.builder(
              physics: NeverScrollableScrollPhysics(),
                    itemCount: popularList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 8.0, // Spacing between columns

                        childAspectRatio: size.width / size.height * 1.4
                        // Spacing between rows
                        ),
                    itemBuilder: (context, index) {
                      final allPopularItem = popularList[index];
                      return PopularGrid(
                        popular: allPopularItem,
                        themeBool: themeBool,
                        theme: themeData,
                        index: index > 2 && index.isOdd,
                      );
                    }
            );
          }
          return Container();
        });
  }
}
