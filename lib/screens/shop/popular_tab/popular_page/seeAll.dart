import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/all.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/electronics.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/furniture.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/outfits.dart';

class SeeAll extends StatefulWidget {
  final ScrollController controller;
  const SeeAll({super.key, required this.controller});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final theme = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: theme.backgroundColor),
        child: NestedScrollView(
          headerSliverBuilder: (context, bool) {
            return <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                backgroundColor: const Color(onBoardingButtonColor),
                expandedHeight: size.height / 9,
                bottom: TabBar(
                    controller: _tabController,
                    labelPadding: const EdgeInsets.all(8),
                    // onTap: (indexs) {
                    //   setState(() {
                    //     index = indexs;
                    //   });
                    // },
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 7),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                    indicator: BoxDecoration(
                        color: const Color(onBoardingButtonColor),
                        borderRadius: BorderRadius.circular(30)),
                    tabs: [
                      Tab(
                        child: Container(
                          height: size.height / 21,
                          width: size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(onBoardingButtonColor),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'All',
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: size.height / 20,
                          width: size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(onBoardingButtonColor),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Electronics',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: size.height / 21,
                          width: size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(onBoardingButtonColor),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Furniture',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: size.height / 21,
                          width: size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(onBoardingButtonColor),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Outfit',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              All(
                  themeBool: themeBool,
                  themeData: theme,
                  controller: widget.controller),
              Electronics(
                  themeBool: themeBool,
                  themeData: theme,
                  controller: widget.controller),
              Furniture(
                  themeBool: themeBool,
                  themeData: theme,
                  controller: widget.controller),
              OutFit(
                  themeBool: themeBool,
                  themeData: theme,
                  controller: widget.controller),
            ],
          ),
        ),
      ),
    );
  }
}
