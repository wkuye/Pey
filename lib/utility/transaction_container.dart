import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

class TransactionContainer extends StatelessWidget {
  final String type;
  final String date;
  final String amount;
  final bool recepientBool;
  const TransactionContainer(
      {super.key,
      required this.type,
      required this.date,
      required this.amount, required this.recepientBool});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(10),
        height: size.height / 9.6,
        child: Stack(
          children: [
            Positioned(child: Image.asset(transICon)),
            Positioned(
                left: 55,
                child: type.contains('Credit')
                    ?  recepientBool?const Text('Received'): const Text('Transfer')
                    : const Text('Top up')),
            Positioned(top: 30, left: 55, child: Text(date)),
            Positioned(top: 8, right: 5, child: Text('\$ $amount')),
            Positioned(
                height:
                    Platform.isAndroid ? size.height / 6.6 : size.height / 7,
                width: size.width,
                child: Divider(
                  height: 190,
                  indent: 57,
                  color: Colors.grey[500],
                ))
          ],
        ));
  }
}
