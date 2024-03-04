import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pey_ltd_mobile/api/map/LoginMap.dart';
import 'package:pey_ltd_mobile/api/error/error_Strings.dart';

import 'package:pey_ltd_mobile/api/error/login_error.dart';
import 'package:pey_ltd_mobile/api/models/user.dart';
import 'package:pey_ltd_mobile/api/url_strings.dart';
import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';
import 'package:pey_ltd_mobile/classes/auth_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAuth {
  final String email;
  final String password;
  final AuthBloc authBloc;
  final BuildContext context;
  final Future<SharedPreferences> prefs;
  LoginAuth(
      {required this.email,
      required this.password,
      required this.authBloc,
      required this.context,
      required this.prefs});

  void loginRequest() async {
    final SharedPreferences pref = await prefs;
    authBloc.add(Loading());
    try {
      var loginurl = Platform.isAndroid ? androidLoginUrl : loginUrl;
      var response = await http.post(Uri.parse(loginurl),
          body: LoginApi(email: email, password: password));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        authBloc.add(Login());
        var user = User.fromjson(data);
        pref.setString('token', user.token);

        pref.setInt('id', user.id);
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => true,
            arguments: user);
      } else {
        var error = jsonDecode(response.body);
        print(error);
        var errorResponse = LoginError.fromJson(error);
        if (errorResponse.emailErrors.contains(emptyEmail) ||
            errorResponse.emailErrors.contains(uniqueEmailError)) {
          authBloc.add(LoginErrors(
              emailError: errorResponse.emailErrors.single,
              passwordError: errorResponse.emailErrors.singleOrNull == null
                  ? ''
                  : errorResponse.passwordErrors.single));
        }
        if (errorResponse.passwordErrors.contains(emptyPassword)) {
          authBloc.add(LoginErrors(
              emailError: errorResponse.emailErrors.singleOrNull == null
                  ? ''
                  : errorResponse.emailErrors.single,
              passwordError: errorResponse.passwordErrors.single));
        }
        if (errorResponse.invalidEmail.contains(invalidEmail)) {
          authBloc.add(LoginErrors(
              emailError: errorResponse.invalidEmail, passwordError: ''));
        }
        if (errorResponse.invalidPassword.contains(invalidPassword)) {
          authBloc.add(LoginErrors(
              emailError: '', passwordError: errorResponse.invalidPassword));
        }
      }
    } on http.ClientException catch (e) {
      print('e.toString():${e.toString()}');
    }
  }
}
