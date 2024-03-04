import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pey_ltd_mobile/api/http_request/get_transaction.dart';
import 'package:pey_ltd_mobile/api/models/transaction.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/all.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/month.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/week.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/transactionTabs/year.dart';


class SeeAll extends StatefulWidget {
  final String userID;
  const SeeAll({super.key, required this.userID});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> with SingleTickerProviderStateMixin {
  int index = 0;
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
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: FutureBuilder(
          future: GetTransactions().getallUserTransaction(widget.userID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var transactionResponse = jsonDecode(snapshot.data!.body);
              List<dynamic> transactionList =
                  transactionResponse['transactions'];
              List<Transaction> transactionLists =
                  transactionList.map((e) => Transaction.fromJson(e)).toList();
              if (transactionLists.isEmpty) {
                return Center(
                  child: Text(
                    'No Transactions Made This Week',
                    style: TextStyle(color: theme.primaryColor),
                  ),
                );
              }
              return Container(
                height: size.height,
                width: size.width,
                child: NestedScrollView(headerSliverBuilder: (context, bool) {
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
                                Tab(
                                  child: Container(
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
                                  ),
                                ),
                                Tab(
                                  child: Container(
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
                                      style: TextStyle(),
                                    )),
                                  ),
                                ),
                                Tab(
                                  child: Container(
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
                                      ))),
                                ),
                                Tab(
                                  child: Container(
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
                                      ))),
                                )
                              ]),
                        )
                  ];
                }, body: 
                            TabBarView(controller: _tabController, children: [
                          All(userID: widget.userID),
                          Week(userID: widget.userID),
                          Month(userID: widget.userID),
                          Year(userID: widget.userID)
                        ]),
                      
                    ),
                
              );

              // Flex(direction: Axis.vertical, children: [
              //   Expanded(
              //       child: ListView.builder(
              //           itemCount: transactionLists.length,
              //           itemBuilder: (context, index) {
              //             final transactionIndex = transactionLists[index];
              //             DateTime timestamp =
              //                 DateTime.parse(transactionIndex.createdAt);

              //             // Format the DateTime to "Dec 8, 2023 | 11:30 AM"
              //             String formattedDate =
              //                 DateFormat("MMM d, yyyy | hh:mm a")
              //                     .format(timestamp);
              //             var recepientBool = widget.userID ==
              //                 transactionIndex.recepientID.toString();
              //             if (widget.userID ==
              //                     transactionIndex.userID.toString() ||
              //                 recepientBool) {
              //               return TransactionContainer(
              //                 type: transactionIndex.type,
              //                 date: formattedDate,
              //                 amount: transactionIndex.amount,
              //                 recepientBool: recepientBool,
              //               );
              //             }
              //             return null;
              //           })),
              // ]);
            }
            return Container();
          }),
    );
  }
}
