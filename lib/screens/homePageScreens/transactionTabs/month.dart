import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pey_ltd_mobile/api/http_request/get_transaction.dart';
import 'package:pey_ltd_mobile/api/models/transaction.dart';
import 'package:pey_ltd_mobile/utility/transaction_container.dart';

class Month extends StatelessWidget {
  final String userID;
  const Month({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
     final theme = AdaptiveTheme.of(context).theme;
    return Scaffold(
      backgroundColor: theme.backgroundColor ,
      body: Flex(direction: Axis.vertical, children: [
        Expanded(
          child: FutureBuilder(
            future: GetTransactions().getTransactionsByDate(userID,
           'month'), // Replace 1 with the actual user ID
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final transactions = snapshot.data as List<Transaction>;
                       if (transactions.isEmpty) {
                      
                      return Center(
                        child: Text(
                          'No Transactions Made This Week',
                          style: TextStyle(color: theme.primaryColor),
                        ),
                      );
                    }
                return ListView.builder(
                    itemCount: transactions.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final trans = transactions[index];
                      DateTime timestamp = DateTime.parse(trans.createdAt);

                      // Format the DateTime to "Dec 8, 2023 | 11:30 AM"
                      String formattedDate =
                          DateFormat("MMM d, yyyy | hh:mm a").format(timestamp);
                      var recepientBool =
                          userID == trans.recepientID.toString();
                      if (userID == trans.userID.toString() || recepientBool) {
                        return TransactionContainer(
                          type: trans.type,
                          date: formattedDate,
                          amount: trans.amount,
                          recepientBool: recepientBool,
                        );
                      }
                      return null;
                    });
              }
              return Container();
            },
          ),
        ),
      ]),
    );
  }
}
