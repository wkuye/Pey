import 'dart:io';

import 'package:http/http.dart' as http;

class RequestUserBeneficiary {
  Future<http.Response> getUserBeneficiary(String id) async {
    var response = await http.post(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/beneficiary/$id/getBen')
          : Uri.parse('http://127.0.0.1:8000/api/beneficiary/$id/getBen'),
    );
    return response;
  }
}
