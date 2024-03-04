import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PopularRequest {
  Future<List<dynamic>?> getAllPopular() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/popular/getpopular')
          : Uri.parse('http://127.0.0.1:8000/api/popular/getpopular'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['popular'];
      return category;
    }
    return null;
  }
   Future<List<dynamic>?> getAllElectronics() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/popular/getelectronics')
          : Uri.parse('http://127.0.0.1:8000/api/popular/getelectronics'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['popular'];
      return category;
    }
    return null;
  }
   Future<List<dynamic>?> getAllFurniture() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/popular/getfurniture')
          : Uri.parse('http://127.0.0.1:8000/api/popular/getfurniture'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['popular'];
      return category;
    }
    return null;
  }
   Future<List<dynamic>?> getAllOutfit() async {
    var request = await http.get(
      Platform.isAndroid
          ? Uri.parse('http://10.0.2.2:8000/api/popular/getoutfit')
          : Uri.parse('http://127.0.0.1:8000/api/popular/getoutfit'),
    );
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      List<dynamic> category = response['popular'];
      return category;
    }
    return null;
  }
}
