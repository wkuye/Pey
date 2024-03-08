import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/http_request/get_popularRequest.dart';
import 'package:pey_ltd_mobile/api/models/popularModel.dart';
import 'package:pey_ltd_mobile/utility/popular_grid.dart';

class All extends StatelessWidget {
  final bool themeBool;
  final ThemeData themeData;
  final ScrollController controller;
  const All(
      {super.key,
      required this.themeBool,
      required this.themeData,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: PopularRequest().getAllPopular(),
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
                          final price = double.parse(allPopularItem.price);

                        final discountPrice =
                            double.parse(allPopularItem.discount);

                        final discountedPrice = price -
                            (price * discountPrice/100); 
                        print(discountedPrice);
                      return PopularGrid(
                        popular: allPopularItem,
                        themeBool: themeBool,
                        theme: themeData,
                        index: index > 2 && index.isOdd, discountPrice: discountedPrice.toStringAsFixed(2),
                      );
                    }
            );
          }
          return Container();
        });
  }
}
