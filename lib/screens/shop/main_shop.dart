import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/http_request/getSubCategories.dart';
import 'package:pey_ltd_mobile/api/http_request/shopRequests.dart';
import 'package:pey_ltd_mobile/api/models/CategoryModel.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/screens/shop/category_pages/category_list.dart';
import 'package:pey_ltd_mobile/screens/shop/category_pages/sub_categoryList.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/all.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/electronics.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/furniture.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/outfits.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/popular_page/seeAll.dart';
import 'package:pey_ltd_mobile/utility/main_shopHeader.dart';
import 'package:pey_ltd_mobile/utility/shopSearch.dart';

class MyShop extends StatefulWidget {
  const MyShop({super.key});

  @override
  State<MyShop> createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> with AutomaticKeepAliveClientMixin {
  final PageController _controller = PageController();
  int index = 0;

  late Future<List<dynamic>?> _subCategoryFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _subCategoryFuture = SubCategoryRequest().getSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    final theme = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;

    return DefaultTabController(
      length: 4,
      initialIndex: index,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(10),
            height: size.height,
            width: size.width, // Set a fixed or maximum height here
            child: FutureBuilder(
              future: ShopRequests().getCategory(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: snapshot.connectionState == ConnectionState.waiting
                        ? const CircularProgressIndicator()
                        : Text(
                            'Server Out',
                            style: TextStyle(
                                color: theme.primaryColor, fontSize: 30),
                          ),
                  );
                }
                if (snapshot.hasData) {
                  var list = snapshot.data;
                  final List<Category> categoryList =
                      list!.map((json) => Category.fromJson(json)).toList();
                  return CustomScrollView(
                  
                      // SliverToBoxAdapter(
                      //   child: Container(
                      //     height: size.height,
                      //     width:
                      //         size.width, // Set a fixed or maximum height here
                      //     color: Color(0xffF6F6F6),
                      //     child: 
                      //   ),
                      // )
                    
                   
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              MainShopHeader(theme: theme),
                              const SizedBox(height: 15),
                              ShopSearch(
                                  size: size,
                                  theme: theme,
                                  themeBool: themeBool),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                      color: theme.primaryColor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                 
                                ],
                              ),
                              const SizedBox(height: 10),
                              CategoryList(
                                  categoryList: categoryList, size: size),
                              const SizedBox(height: 12),
                              SubCategoryList(
                                size: size,
                                controller: _controller,
                                subCategoryFuture: _subCategoryFuture,
                                theme: theme,
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Text(
                                    'Popular',
                                    style: TextStyle(
                                      color: theme.primaryColor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeAll())),
                                    child: const Text(
                                      'See all',
                                      style: TextStyle(
                                          color: Color(onBoardingButtonColor)),
                                    ),
                                  ),
                                ],
                              ),
                              TabBar(
                                labelPadding: const EdgeInsets.all(8),
                                onTap: (indexs) {
                                  setState(() {
                                    index = indexs;
                                  });
                                },
                                indicatorPadding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                unselectedLabelColor: Colors.black,
                                labelColor: Colors.white,
                                labelStyle: const TextStyle(
                                    fontWeight: FontWeight.w700),
                                indicator: BoxDecoration(
                                  color: const Color(onBoardingButtonColor),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                tabs: [
                              Tab(child:  Container(
                                          height: size.height / 21,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(
                                                  onBoardingButtonColor),
                                              width: 1.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'All',
                                            
                                            ),
                                          ),
                                        ),),
                                      
                                      Tab(child:   Container(
                                          height: size.height / 20,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(
                                                  onBoardingButtonColor),
                                              width: 1.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Electronics',
                                              style: TextStyle(

                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),),
                           
                                     
                                 Tab(child:   Container(
                                          height: size.height / 21,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(
                                                  onBoardingButtonColor),
                                              width: 1.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Furniture',
                                              style: TextStyle(
                                              
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),) ,  
                               
                               Tab(child:  Container(
                                          height: size.height / 21,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(
                                                  onBoardingButtonColor),
                                              width: 1.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Outfit',
                                              style: TextStyle(
                                               
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),)     
                                 
                                    
                                ],
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: size.height/1.6,child: 
                        TabBarView(
                            children: [
                              All(
                                  themeBool: themeBool,
                                  themeData: theme,
                                 ),
                              Electronics(themeBool: themeBool,
                                  themeData: theme,
                              ),
                              Furniture(  themeBool: themeBool,
                                  themeData: theme,
                                 ),
                              OutFit(themeBool: themeBool,
                                  themeData: theme,
                                  ),
                            ],
                          ),),)
                      ]
             
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
