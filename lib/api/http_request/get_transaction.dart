import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pey_ltd_mobile/api/models/transaction.dart';

class GetTransactions {
  Future<http.Response> getallUserTransaction(String user) async {
    var response = await http.post(
      Uri.parse(Platform.isAndroid
          ? 'http://10.0.2.2:8000/api/transaction/$user'
          : 'http://127.0.0.1:8000/api/transaction/$user'),
    );
    return response;
  }

  Future<List<Transaction>> getTransactionsByDate(String id,
   String dateRange) async {
    final response = await http.get(
      Uri.parse(Platform.isAndroid
          ? 'http://10.0.2.2:8000/api/transaction/$id/$dateRange'
          : 'http://127.0.0.1:8000/api/transaction/$id/$dateRange'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      final List<dynamic> datas = data['transactions'];
      var weekTransaction = datas.map((e) => Transaction.fromJson(e)).toList();
      return weekTransaction;
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
      return [];
    }
  }
}
