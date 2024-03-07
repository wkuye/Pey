import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/models/itemModel.dart';
import 'package:pey_ltd_mobile/utility/item_grid.dart';
import 'package:pey_ltd_mobile/utility/popular_grid.dart';

class SubCategoryIndexContainer extends StatelessWidget {
  final Future<List<dynamic>?> future;
  const SubCategoryIndexContainer({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: size.height,
          width: size.width,
          color: theme.backgroundColor,
          child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var itemLists = snapshot.data;
                  List<item> itemList =
                      itemLists!.map((json) => item.fromJson(json)).toList();
                  return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: itemList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 8.0, // Spacing between columns

                          childAspectRatio: size.width / size.height * 1.4
                          // Spacing between rows
                          ),
                      itemBuilder: (context, index) {
                        final allItem = itemList[index];
                        return ItemGrid(
                            items: allItem,
                            themeBool: themeBool,
                            index: index > 2 && index.isOdd,
                            theme: theme);
                      });
                }
                return Container();
              })),
    );
  }
}
