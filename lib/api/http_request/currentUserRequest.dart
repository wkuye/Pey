
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:pey_ltd_mobile/api/url_strings.dart';

class CurrentUserRequest {
  Future<http.Response> getCurrentUser() async {
    final shared = await SharedPreferences.getInstance();
    var id = shared.getInt('id');
    var user = await http.post(Uri.parse(Platform.isAndroid?'$getAndroidCurrentUserUrl=$id' : '$getCurrentUserUrl=$id'));

    // var data = jsonDecode(user.body);
    // print(data);
    // var users = user.statusCode != 200
    //     ? User('', 0, '', '', null, null)
    //     : User.fromjson(data);

    // final user = snapshot.data!.getString('user');
    // var response = jsonDecode(user!);
    return user;
  }

  setCardState(bool card) async {
    final shared = await SharedPreferences.getInstance();
    shared.setBool('card', card);
  }

  Future<bool?> getCardState() async {
    final shared = await SharedPreferences.getInstance();
    var bool = shared.getBool('card');
    return bool;
  }
}
