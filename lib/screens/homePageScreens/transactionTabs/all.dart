import 'dart:convert';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/http_request/get_transaction.dart';
import 'package:pey_ltd_mobile/api/models/transaction.dart';
import 'package:pey_ltd_mobile/utility/transaction_container.dart';

class All extends StatelessWidget {
  final String userID;
  const All({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return FutureBuilder(
        future: GetTransactions().getallUserTransaction(userID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var transactionResponse = jsonDecode(snapshot.data!.body);
            List<dynamic> transactionList = transactionResponse['transactions'];
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
            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transactionLists.length,
                itemBuilder: (context, index) {
                  final transactionIndex = transactionLists[index];
                  DateTime timestamp =
                      DateTime.parse(transactionIndex.createdAt);

                  // Format the DateTime to "Dec 8, 2023 | 11:30 AM"
                  String formattedDate =
                      DateFormat("MMM d, yyyy | hh:mm a").format(timestamp);
                  var recepientBool =
                      userID == transactionIndex.recepientID.toString();
                  if (userID == transactionIndex.userID.toString() ||
                      recepientBool) {
                    return TransactionContainer(
                      type: transactionIndex.type,
                      date: formattedDate,
                      amount: transactionIndex.amount,
                      recepientBool: recepientBool,
                    );
                  }
                  return null;
                });
          }
          return Container();
        });
  }
}
