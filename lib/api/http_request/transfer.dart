import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:pey_ltd_mobile/api/map/transferMap.dart';

class RequestTransfer {
  makeTransfer(String id, String recepientId, dynamic amount, String type,
      dynamic description) async {

      await http.post(
          Uri.parse(Platform.isAndroid
              ? 'http://10.0.2.2:8000/api/transaction/$id/transfer'
              : 'http://127.0.0.1:8000/api/transaction/$id/transfer'),
          body: TransferMap(
              recepient_id: recepientId,
              amount:amount,
              type: type,
              description: description));

  }
}
