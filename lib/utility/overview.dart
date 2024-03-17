import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pey_ltd_mobile/api/http_request/shopRequests.dart';
import 'package:pey_ltd_mobile/api/models/itemModel.dart';

import 'package:pey_ltd_mobile/api/models/popularModel.dart';
import 'package:pey_ltd_mobile/bloc/addToCartBloc.dart';
import 'package:pey_ltd_mobile/bloc/addToCartState.dart';
import 'package:pey_ltd_mobile/bloc/addToCart_event.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/screens/shop/popular_tab/popular_page/seeAll.dart';
import 'package:pey_ltd_mobile/utility/item_grid.dart';

// ignore: must_be_immutable
class OverView extends StatelessWidget {
  OverView({
    super.key,
  });

  PaletteGenerator? pallette;

  Future<PaletteGenerator> pallete(String image) async {
    final PaletteGenerator pal = await PaletteGenerator.fromImageProvider(
        NetworkImage('http://127.0.0.1:8000/${image}'),
        size: const Size(200, 100),
        maximumColorCount: 20);
    return pal;
  }

  String truncateString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength - 3)}...';
    }
  }

  getObectType(dynamic arg) {
    if (arg is Popular) {
      // If the argument is of type Popular, return its title
      return arg;
    } else if (arg is item) {
      // If the argument is of type Item, return its name
      return arg;
    }
    return arg;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;
 
    // ignore: unnecessary_type_checkç
   final object= getObectType(ModalRoute.of(context)!.settings.arguments);
    pallete(object.image).then((value) {
      context.read<AddToCartBloc>().add(PalletteComplete(
            palettteComplete: true,
            palette: value,
          ));
    });
    return BlocBuilder<AddToCartBloc, CartState>(builder: (context, state) {
      return state.paletteComplete
          ? Scaffold(
              body: Container(
                height: size.height,
                width: size.width,
                decoration:
                    BoxDecoration(color: state.palette!.dominantColor!.color),
                child: CustomScrollView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                          pinned: true,
                          expandedHeight: size.height / 3.5,
                          flexibleSpace: Container(
                            height: size.height / 2.5,
                            width: size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'http://127.0.0.1:8000/${object.image}'))),
                          )),
                      SliverToBoxAdapter(
                        child: Container(
                          height: size.height / 2.3,
                          child: Column(
                            children: [
                              Container(
                                height: size.height / 2.5,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 19),
                                color: theme.backgroundColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Overview',
                                          style: TextStyle(
                                              color: theme.primaryColor,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Container(
                                          height: size.height / 9.5,
                                          width: size.width / 4.5,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    'http://127.0.0.1:8000/${object.image}',
                                                  )),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: size.height / 9.5,
                                          width: size.width / 4.5,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    'http://127.0.0.1:8000/${object.image}',
                                                  )),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: size.height / 9.5,
                                          width: size.width / 4.5,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    'http://127.0.0.1:8000/${object.image}',
                                                  )),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        const Spacer(
                                          flex: 5,
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          truncateString(object.name, 17),
                                          style: TextStyle(
                                              color: theme.primaryColor,
                                              fontSize: 25,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '\$${object.price}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    const Text(
                                      'Lagos, Agege',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(
                                      flex: 2,
                                    ),
                                    Container(
                                      height: size.height / 12,
                                      decoration: BoxDecoration(
                                          color: const Color(
                                              onBoardingButtonColor),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: const Center(
                                        child: Text(
                                          'Show Contact Info',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: size.height / 9,
                          child: Container(
                            color: theme.backgroundColor,
                            child: Row(
                              children: [
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(9),
                                  height: size.height / 13,
                                  width: size.width / 1.6,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(11)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Start chat with seller',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: size.height / 13,
                                  width: size.width / 4,
                                  decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: BorderRadius.circular(11)),
                                  child: Center(
                                    child: Text(
                                      'Start',
                                      style: TextStyle(
                                          color: theme.backgroundColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: Container(
                        width: size.width,
                        margin: const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        padding: const EdgeInsets.all(14),
                        height: size.height / 2.3,
                        color: theme.backgroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About',
                              style: TextStyle(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const Spacer(),
                            Text(object.description,
                                maxLines: 3,
                                style: const TextStyle(
                                  color: Color(
                                    0xff707B81,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            const Spacer(),
                            const Row(
                              children: [
                                Spacer(),
                                Text(
                                  'Read More',
                                  style: TextStyle(
                                      color: Color(onBoardingButtonColor),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: size.height / 12,
                              decoration: BoxDecoration(
                                  color: const Color(onBoardingButtonColor),
                                  borderRadius: BorderRadius.circular(14)),
                              child: const Center(
                                child: Text(
                                  'Begin Purchase',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: size.height / 12,
                              decoration: BoxDecoration(
                                  color: const Color(onBoardingButtonColor),
                                  borderRadius: BorderRadius.circular(14)),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.card_travel,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      SliverToBoxAdapter(
                        child: Container(
                          height: size.height / 2.2,
                          color: theme.backgroundColor,
                          padding: const EdgeInsets.all(12),
                          child: FutureBuilder(
                              future: ShopRequests()
                                  .getSimilarProduct(object.cat_id.toString()),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var popularLists = snapshot.data;
                                  List<item> popularList = popularLists!
                                      .map((json) => item.fromJson(json))
                                      .toList();

                                  popularList.removeWhere((element) =>
                                      element.name == object.name);

                                  return Container(
                                    height: size.height / 2,
                                    width: size.width,
                                    child: popularList.isEmpty
                                        ? Center(
                                            child: Text(
                                              'No Similar Products',
                                              style: TextStyle(
                                                  color: theme.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Similar Products',
                                                    style: TextStyle(
                                                        color:
                                                            theme.primaryColor,
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () => Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const SeeAll())),
                                                    child: const Text(
                                                      'See all',
                                                      style: TextStyle(
                                                          color: Color(
                                                              onBoardingButtonColor)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: GridView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        popularList.length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount:
                                                                2, // Number of columns
                                                            crossAxisSpacing:
                                                                8.0, // Spacing between columns

                                                            childAspectRatio:
                                                                size.width /
                                                                    size
                                                                        .height *
                                                                    1.4
                                                            // Spacing between rows
                                                            ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      final allPopularItem =
                                                          popularList[index];
                                                      final price =
                                                          double.parse(
                                                              allPopularItem
                                                                  .price);

                                                      final discountPrice = double
                                                          .parse(allPopularItem
                                                              .discounted_price);

                                                      final discountedPrice =
                                                          price -
                                                              (price *
                                                                  discountPrice /
                                                                  100);

                                                      return GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/overview',
                                                              arguments:
                                                                  allPopularItem);
                                                        },
                                                        child: ItemGrid(
                                                          themeBool: themeBool,
                                                          theme: theme,
                                                          index: index > 2 &&
                                                              index.isOdd,
                                                          discountPrice:
                                                              discountedPrice
                                                                  .toStringAsFixed(
                                                                      2),
                                                          items: allPopularItem,
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                  );
                                }
                                return Container();
                              }),
                        ),
                      )
                    ]),
              ),
            )
          : Container();
    });
  }
}
