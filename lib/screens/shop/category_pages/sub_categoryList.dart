import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/http_request/getSubCategories.dart';
import 'package:pey_ltd_mobile/api/models/subCategoryModel.dart';
import 'package:pey_ltd_mobile/screens/shop/category_pages/sub_categoryindexContainer.dart';
import 'package:pey_ltd_mobile/utility/subCategoryContainer.dart';

class SubCategoryList extends StatefulWidget {
  final Future<List<dynamic>?> subCategoryFuture;

  final Size size;
  final ThemeData theme;
  final PageController controller;

  const SubCategoryList({
    super.key,
    required this.size,
    required this.controller,
    required this.subCategoryFuture,
    required this.theme,
  });

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.subCategoryFuture,
        builder: (subcontext, category) {
          if (category.hasData) {
            final List<dynamic>? list = category.data;
            final List<SubCategory> SubCategoryList =
                list!.map((json) => SubCategory.fromJson(json)).toList();
            return Stack(
              children: [
                Container(
                    height: widget.size.height / 5,
                    child: PageView.builder(
                        allowImplicitScrolling: true,
                        controller: widget.controller,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemCount: SubCategoryList.length,
                        itemBuilder: (subcontext, index) {
                          final subCategory = SubCategoryList[index];
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SubCategoryIndexContainer(
                                                future: SubCategoryRequest()
                                                    .get1stSubCategory())));
                              } else if (index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SubCategoryIndexContainer(
                                                future: SubCategoryRequest()
                                                    .get2ndSubCategory())));
                              } else if (index == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SubCategoryIndexContainer(
                                                future: SubCategoryRequest()
                                                    .get3rdSubCategory())));
                              }
                            },
                            child: SubCategoryContainer(
                              size: widget.size,
                              image: subCategory.image,
                              name: subCategory.name,
                              description1: subCategory.description1,
                              description2: subCategory.description2,
                              theme: widget.theme,
                            ),
                          );
                        })),
                Positioned(
                  top: widget.size.height / 6,
                  right: 0,
                  left: 0,
                  child: DotsIndicator(
                    dotsCount: SubCategoryList.length,
                    position: _currentPage,
                    decorator: DotsDecorator(
                      size: const Size.square(8.0),
                      activeSize: const Size(20.0, 8.0),
                      activeColor: widget.theme.primaryColor,
                      color: Colors.grey,
                      spacing: const EdgeInsets.all(4.0),
                      // activeShape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                    ),
                  ),
                )
              ],
            );
          }
          return Container();
        });
  }
}
