import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pey_ltd_mobile/api/map/addBeneficiaryMap.dart';

class RequestAddBeneficiary {
  Future<http.Response> addEmailToBeneficiary(String id, String email) {
    var response = http.post(
        Uri.parse( Platform.isAndroid?'http://10.0.2.2:8000/api/beneficiary/$id/add_ben': 'http://127.0.0.1:8000/api/beneficiary/$id/add_ben'),
        body: BeneficiaryMap(email: email));
    return response;
  }
}
