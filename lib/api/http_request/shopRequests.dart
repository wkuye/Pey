import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ShopRequests {
  Future<List<dynamic>?> getCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/category/get')
          : Uri.parse('http://127.0.0.1:8000/api/category/get'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['category'];
      return category;
    }
    return null;
  }
}
