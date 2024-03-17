import 'dart:convert';
import 'dart:io';
import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/http_request/currentUserRequest.dart';
import 'package:pey_ltd_mobile/api/http_request/getUserBeneficiary.dart';
import 'package:pey_ltd_mobile/api/models/user.dart';
import 'package:pey_ltd_mobile/bloc/quick_TransferBloc.dart';
import 'package:pey_ltd_mobile/classes/quickTransferEvent.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/all.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/month.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/seeall.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/week.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/year.dart';
import 'package:pey_ltd_mobile/utility/quick_transferCard.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.user, required this.beneficiary});
  final User user;
  final List<QuickTransferCard> beneficiary;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FlipCardController _controller;
  List benList = [];
  int index = 0;
  // final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RequestUserBeneficiary()
        .getUserBeneficiary(widget.user.id.toString())
        .then((value) {
      var beneficiarys = jsonDecode(value.body);
      List bent = beneficiarys['beneficiary'];
      bent.map((json) => beneficiary.fromJson(json)).forEach((ben) {
        if (widget.beneficiary.last.ben == null) {
          context.read<QuickTransferBloc>().add(addBeneficiary(
                image: ben.beneficiary_image,
                size: MediaQuery.of(context).size,
                name: ben.beneficiary_name,
                ben: ben,
                list: widget.beneficiary,
              ));
        } else {
          List<QuickTransferCard> sublist = widget.beneficiary.sublist(3);

          bool isAlreadyAdded = sublist.any((e) => e.ben!.benId == ben.benId);
          if (!isAlreadyAdded) {
            context.read<QuickTransferBloc>().add(addBeneficiary(
                  image: ben.beneficiary_image,
                  size: MediaQuery.of(context).size,
                  name: ben.beneficiary_name,
                  ben: ben,
                  list: widget.beneficiary,
                ));
          }
        }
      });
    });

    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AdaptiveTheme.of(context).theme;
    return DefaultTabController(
        length: 4,
        initialIndex: index,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: theme.backgroundColor,
            actions: [
              const Spacer(),
              CachedNetworkImage(
                imageUrl: widget.user.image.isEmpty
                    ? defaultProfile
                    : Platform.isAndroid
                        ? 'http://10.0.2.2:8000/${widget.user.image}'
                        : 'http://127.0.0.1:8000/${widget.user.image}',
                imageBuilder: (context, imageprovider) => Container(
                  width: size.width / 9,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageprovider)),
                ),
              ),
              const Spacer(
                flex: 4,
              ),
              Center(
                  child: Text(
                "Morning, ${widget.user.name}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: theme.primaryColor),
              )),
              const Spacer(
                flex: 4,
              ),
              const Icon(Icons.notifications),
              const Spacer()
            ],
          ),
          body: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: theme.backgroundColor,
              child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  
                SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        FutureBuilder(
                            future: CurrentUserRequest().getCardState(),
                            builder: (context, snapshot) {
                              return FlipCard(
                                flipOnTouch: false,
                                controller: _controller,
                                side: snapshot.data == true
                                    ? CardSide.BACK
                                    : CardSide.FRONT,
                                front: Container(
                                  height: size.height / 4,
                                  width: size.width / 1.1,
                                  decoration: BoxDecoration(
                                      color: const Color(cardColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          child: Image.asset(
                                        leftCardDesign,
                                        width: 280,
                                      )),
                                      Positioned(
                                          right: 5,
                                          child: Image.asset(
                                            rightCardDesign,
                                            width: 150,
                                          )),
                                      Positioned(
                                          left: 30,
                                          top: 30,
                                          child: Container(
                                            height: size.height / 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Your Flex Balance',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "\$${widget.user.balance.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          Platform.isAndroid
                                                              ? 16
                                                              : 21),
                                                ),
                                                const Spacer(),
                                                const Text(
                                                  'Total income',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "\$${widget.user.balance.toString()}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                const Spacer(flex: 5)
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                          right: 30,
                                          top: 30,
                                          child: Container(
                                            height: size.height / 5.5,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    _controller.toggleCard();
                                                    var card = _controller
                                                        .state!.isFront;
                                                    print(card);
                                                    CurrentUserRequest()
                                                        .setCardState(card);
                                                  },
                                                  child: Container(
                                                    height: size.height / 24,
                                                    width: size.width / 8,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 2)),
                                                    child: const Center(
                                                        child: Text(
                                                      'Hide',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  ),
                                                ),
                                                const Spacer(
                                                  flex: 2,
                                                ),
                                                const Text(
                                                  'Expenses',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  '\$${widget.user.expenses}',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                const Spacer(
                                                  flex: 4,
                                                )
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                          bottom: 33,
                                          child: Image.asset(faintProgressBar)),
                                      Positioned(
                                          bottom: 30,
                                          child:
                                              Image.asset(coloredProgressBar))
                                    ],
                                  ),
                                ),
                                back: Container(
                                  height: size.height / 4,
                                  width: size.width / 1.1,
                                  decoration: BoxDecoration(
                                      color: const Color(cardColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          child: Image.asset(
                                        leftCardDesign,
                                        width: 280,
                                      )),
                                      Positioned(
                                          right: 5,
                                          child: Image.asset(
                                            rightCardDesign,
                                            width: 150,
                                          )),
                                      Positioned(
                                        right: 30,
                                        top: 30,
                                        child: GestureDetector(
                                          onTap: () {
                                            _controller.toggleCard();
                                            var card =
                                                _controller.state!.isFront;

                                            CurrentUserRequest()
                                                .setCardState(card);
                                          },
                                          child: Container(
                                            height: size.height / 24,
                                            width: size.width / 8,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2)),
                                            child: const Center(
                                                child: Text(
                                              'show',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Text(
                            'Quick Transfer',
                            style: TextStyle(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            height: size.height / 8.5,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.beneficiary.length,
                                itemBuilder: (context, item) {
                                  final items = widget.beneficiary[item];

                                  return Row(children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: items.ontap,
                                            child: items.icon),
                                        Text(
                                          items.name,
                                          style: TextStyle(
                                              color: theme.primaryColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                  ]);
                                })),
                        Container(
                          height: size.height / 8,
                          width: size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(downloadAdd),
                                  fit: BoxFit.fill)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Transaction history',
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Center(
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeeAll(
                                              userID: widget.user.id.toString(),
                                            ))),
                                child: const Text(
                                  'See all ->',
                                  style: TextStyle(
                                      color: Color(onBoardingButtonColor),
                                      fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
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
                            labelStyle:
                                const TextStyle(fontWeight: FontWeight.w700),
                            indicator: BoxDecoration(
                                color: const Color(onBoardingButtonColor),
                                borderRadius: BorderRadius.circular(30)),
                            tabs: [
                               Tab(child: Container(
                                        height: size.height / 21,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(
                                                    onBoardingButtonColor),
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Center(
                                            child: Text(
                                          'All',
                                         
                                        )),
                                      ),),
                                     
                                Tab(child:      Container(
                                        height: size.height / 21,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(
                                                    onBoardingButtonColor),
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Center(
                                            child: Text(
                                          'A week',
                                          style: TextStyle(
                                        ),
                                        )),
                                      ),),
                          
                              Tab(child:    Container(
                                        height: size.height / 21,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(
                                                    onBoardingButtonColor),
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Center(
                                            child: Text(
                                          'A month',
                                          
                                        ))),),
                             
                       
                             Tab(child:  Container(
                                        height: size.height / 21,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(
                                                    onBoardingButtonColor),
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Center(
                                            child: Text(
                                          'One year',
                                          
                                        ))),)
                            ]),
                      ]),
                ),
               
                  SliverToBoxAdapter(
                      child: Container(
                        height: size.height/5,
                        child: 
                          TabBarView(children: [
                                              All(
                          userID: widget.user.id.toString(),
                                              ),
                                              Week(
                          userID: widget.user.id.toString(),
                                              ),
                                              Month(
                          userID: widget.user.id.toString(),
                                              ),
                                              Year(
                          userID: widget.user.id.toString(),
                                              )
                                            ])
                      
                      )),
  
              ])),
        ));
  }
}
