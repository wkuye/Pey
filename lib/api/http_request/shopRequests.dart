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
    Future<List<dynamic>?> getFirstCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/category/first')
          : Uri.parse('http://127.0.0.1:8000/api/category/first'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['category'];
      return category;
    }
    return null;
  }
   Future<List<dynamic>?> getSecondCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/category/second')
          : Uri.parse('http://127.0.0.1:8000/api/category/second'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['category'];
      return category;
    }
    return null;
  }
   Future<List<dynamic>?> getThirdCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/category/third')
          : Uri.parse('http://127.0.0.1:8000/api/category/third'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['category'];
      return category;
    }
    return null;
  }
   Future<List<dynamic>?> getFourthCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/category/fourth')
          : Uri.parse('http://127.0.0.1:8000/api/category/fourth'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['category'];
      return category;
    }
    return null;
  }
   Future<List<dynamic>?> getFifthCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/category/fifth')
          : Uri.parse('http://127.0.0.1:8000/api/category/fifth'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['category'];
      return category;
    }
    return null;
  }
   Future<List<dynamic>?> getSimilarProduct(String id) async {
    var request = await http.post(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/category/$id/similar')
          : Uri.parse('http://127.0.0.1:8000/api/category/$id/similar'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['category'];
      return category;
    }
    return null;
  }
}
