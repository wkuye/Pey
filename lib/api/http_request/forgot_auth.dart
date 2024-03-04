import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pey_ltd_mobile/api/map/ForgotMap.dart';
import 'package:pey_ltd_mobile/api/error/error_Strings.dart';

import 'package:pey_ltd_mobile/api/error/register_error.dart';
import 'package:pey_ltd_mobile/api/url_strings.dart';
import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';
import 'package:pey_ltd_mobile/classes/auth_event.dart';
import 'package:pey_ltd_mobile/classes/auth_state.dart';

class ForgotAuth {
  final String email;
  final TextEditingController passWord;
  final TextEditingController newPassword;
  final BuildContext context;
  final AuthState authState;
  final bool min;
  final bool match;
  ForgotAuth(
      {required this.passWord,
      required this.newPassword,
      required this.context,
      required this.email,
      required this.min,
      required this.match,
      required this.authState});
  request() async {
    try {
      var url = Platform.isAndroid ? androidResetUrl : resetUrl;
      var response = await http.post(Uri.parse(url),
          body: ForgotMap(
              password: passWord.text,
              newPassword: newPassword.text,
              email: email));

      if (response.statusCode == 200) {
        const int index = 0;
        // ignore: use_build_context_synchronously
        context
            .read<AuthBloc>()
            .add(ResetEvent(minPassword: false, match: false));
        Future.delayed(const Duration(milliseconds: 700), () {
  Navigator.pushNamedAndRemoveUntil(
            context, '/loginScreen', (route) => true,
            arguments: index);
        });
        // ignore: use_build_context_synchronously
      
      } else {
        var error = jsonDecode(response.body);

        var errorResponse = AuthError.fromJson(error);

        if (errorResponse.passwordConfirmationError
            .contains(mustMatchPassword)) {
          // ignore: use_build_context_synchronously
          context.read<AuthBloc>().add(ForgetPasswordEvent(
              passwordError: '',
              confirmPasswordError:
                  errorResponse.passwordConfirmationError.singleOrNull == null
                      ? ''
                      : errorResponse.passwordConfirmationError.single,
              match: true,
              min: min ? true : false));
        }
        if (errorResponse.passwordError.contains(emptyPassword)) {
          // ignore: use_build_context_synchronously
          context.read<AuthBloc>().add(ForgetPasswordEvent(
              passwordError: errorResponse.passwordError.singleOrNull == null
                  ? ''
                  : errorResponse.passwordError.single,
              confirmPasswordError: '',
              match: match ? true : false,
              min: true));
        }
        if (errorResponse.passwordConfirmationError
            .contains(emptyPasswordConfirmation)) {
          // ignore: use_build_context_synchronously
          context.read<AuthBloc>().add(ForgetPasswordEvent(
              passwordError: errorResponse.passwordError.singleOrNull == null
                  ? ''
                  : errorResponse.passwordError.single,
              confirmPasswordError:
                  errorResponse.passwordConfirmationError.single,
              match: true,
              min: min ? true : false));
        }
        if (passWord.text.length == 8) {
          // ignore: use_build_context_synchronously
          context.read<AuthBloc>().add(ForgetPasswordEvent(
              passwordError: '',
              confirmPasswordError:
                  errorResponse.passwordConfirmationError.singleOrNull == null
                      ? ''
                      : errorResponse.passwordConfirmationError.single,
              match: match ? true : false,
              min: false));
        } else {
          // ignore: use_build_context_synchronously
          context.read<AuthBloc>().add(ForgetPasswordEvent(
              passwordError: errorResponse.passwordError.singleOrNull == null
                  ? ''
                  : errorResponse.passwordError.single,
              confirmPasswordError:
                  errorResponse.passwordConfirmationError.singleOrNull == null
                      ? ''
                      : errorResponse.passwordConfirmationError.single,
              match: match ? true : false,
              min: true));
        }
        // if (newPassword.text.length != 8) {
        //    // ignore: use_build_context_synchronously
        //    context.read<AuthBloc>().add(ForgetPasswordEvent(
        //     passwordError: errorResponse.passwordError.singleOrNull == null
        //         ? ''
        //         : errorResponse.passwordError.single,
        //     confirmPasswordError:  errorResponse.passwordConfirmationError.singleOrNull == null
        //               ? ''
        //               : errorResponse.passwordConfirmationError.single,
        //     match: true,
        //     min: min ? true : false));
        // }
      }
    // ignore: unused_catch_clause, empty_catches
    } on http.ClientException catch (e) {
    }
  }
}
