import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class SubCategoryRequest {
  Future<List<dynamic>?> getSubCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/subcategory/getsub')
          : Uri.parse('http://127.0.0.1:8000/api/subcategory/getsub'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['subCategory'];
      return category;
    }
    return null;
  }
  Future<List<dynamic>?> get1stSubCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/subcategory/get1st')
          : Uri.parse('http://127.0.0.1:8000/api/subcategory/get1st'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['item'];
      return category;
    }
    return null;
  }
    Future<List<dynamic>?> get2ndSubCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/subcategory/get2nd')
          : Uri.parse('http://127.0.0.1:8000/api/subcategory/get2nd'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['item'];
      return category;
    }
    return null;
  }
    Future<List<dynamic>?> get3rdSubCategory() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/subcategory/get3rd')
          : Uri.parse('http://127.0.0.1:8000/api/subcategory/get3rd'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['item'];
      return category;
    }
    return null;
  }
}
