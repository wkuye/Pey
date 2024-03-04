import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class GetBeneficiary {
  Future<String> getUserName(String email, String id) async {
    var request = await http.post(
        Platform.isAndroid
            ? Uri.parse('http://10.0.2.2:8000/api/beneficiary/$id/ben')
            : Uri.parse('http://127.0.0.1:8000/api/beneficiary/$id/ben'),
        body: {'email': email});

    if (request.statusCode == 200) {
      var data = jsonDecode(request.body);
      return '${data['name']}  ${data['last_name']}';
    }
    return 'User not Found';
  }

  Future<List<dynamic>> searchBeneficiary(String query, String id) async {
    var request = await http.post(Platform.isAndroid
        ? Uri.parse('http://10.0.2.2:8000/api/beneficiary/$id/search?query=$query')
        : Uri.parse(
            'http://127.0.0.1:8000/api/beneficiary/$id/search?query=$query'));

    var data = jsonDecode(request.body);
    final List<dynamic> beneficiaryList = data['beneficiaries'];
    print(data);
    return beneficiaryList;
  }
}
