import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pey_ltd_mobile/api/error/register_error.dart';
import 'package:pey_ltd_mobile/api/error/error_Strings.dart';
import 'package:pey_ltd_mobile/api/models/user.dart';
import 'package:pey_ltd_mobile/api/map/registerMap.dart';
import 'package:pey_ltd_mobile/api/url_strings.dart';
import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';
import 'package:pey_ltd_mobile/classes/auth_event.dart';
import 'package:pey_ltd_mobile/classes/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterAuthRequest {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final AuthBloc authBloc;
  final GlobalKey<FormState> formKey;
  final AuthState state;
  final BuildContext context;
    final Future<SharedPreferences> prefs;
  RegisterAuthRequest(
      {required this.authBloc,
      required this.email,
      required this.firstName,
      required this.formKey,
      required this.lastName,
      required this.state,
      required this.context,
      required this.password,required this.prefs});
  registerRequest() async {
     final SharedPreferences pref = await prefs;
    authBloc.add(Loading());
    try {
      final registerurl = Platform.isAndroid ? androidRegisterUrl : registerUrl;
      final value = await http.post(Uri.parse(registerurl),
          body: RegisterApi(
              email: email,
              firstName: firstName,
              lastName: lastName,
              passWord: password));
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body);
        var user = User.fromjson(data);
         pref.setString('token', user.token);
        authBloc.add(Register());

        // ignore: use_build_context_synchronously
       Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => true,
                            arguments: user);
      } else {
        var error = jsonDecode(value.body);
        print(error);
        var errorResponse = AuthError.fromJson(error);
        if (errorResponse.emailError.contains(emptyEmail)) {
          authBloc.add(ErrorEvent(
              emailError: errorResponse.emailError.last,
              nameError: '',
              passwordError: '',
              lastnameError: ''));
        }
        if (errorResponse.emailError.contains(uniqueEmailError)) {
          authBloc.add(ErrorEvent(
              emailError: errorResponse.emailError.toString(),
              nameError: '',
              passwordError: '',
              lastnameError: ''));
        }
        if (firstName.isEmpty) {
          authBloc.add(FirstNameEvent(
              emailError: errorResponse.emailError.singleOrNull == null
                  ? ''
                  : errorResponse.emailError.single,
              nameError: errorResponse.firstNameError.first,
              passwordError: '',
              lastnameError: ''));
        }
        if (lastName.isEmpty) {
          authBloc.add(LastNameEvent(
              emailError: errorResponse.emailError.singleOrNull == null
                  ? ''
                  : errorResponse.emailError.single,
              nameError: errorResponse.firstNameError.singleOrNull == null
                  ? ''
                  : errorResponse.firstNameError.single,
              passwordError: '',
              lastnameError: errorResponse.lastNameError.single));
        }
        if (password.isEmpty) {
          authBloc.add(PasswordEvent(
              emailError: errorResponse.emailError.singleOrNull == null
                  ? ''
                  : errorResponse.emailError.single,
              nameError: errorResponse.firstNameError.singleOrNull == null
                  ? ''
                  : errorResponse.firstNameError.single,
              passwordError: errorResponse.passwordError.singleOrNull == null
                  ? ''
                  : errorResponse.passwordError.single,
              lastnameError: errorResponse.lastNameError.singleOrNull == null
                  ? ''
                  : errorResponse.lastNameError.single));
        }
      }
    } on http.ClientException catch (e) {
      print('e.toString():${e.toString()}');
    }

    if (formKey.currentState?.validate() ?? false) {
      // The form is valid, perform further actions
      print('Input is valid:');
    }
  }
}
