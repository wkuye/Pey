import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/error/error_Strings.dart';
import 'package:pey_ltd_mobile/api/error/forgot_error.dart';

import 'package:pey_ltd_mobile/api/url_strings.dart';
import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';

import 'package:pey_ltd_mobile/classes/auth_event.dart';
import 'package:pey_ltd_mobile/classes/auth_state.dart';

import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/utility/credentialTextField.dart';
import 'package:http/http.dart' as http;

class ForgottenPassowrd extends StatefulWidget {
  const ForgottenPassowrd({
    super.key,
  });

  @override
  State<ForgottenPassowrd> createState() => _ForgottenPassowrdState();
}

class _ForgottenPassowrdState extends State<ForgottenPassowrd> {
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext bcontext, state) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(loginBackground), fit: BoxFit.cover)),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Center(child: Image.asset(pey)),
                    const Spacer(
                      flex: 2,
                    ),
                    const Text(
                      capitalForgottenPassword,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      forgotHeader,
                      style: TextStyle(
                          color: Color(forgotTextColor),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        textFieldTitle1,
                        style: TextStyle(color: Color(textFieldTitleColor)),
                      ),
                    ),
                    ForgotCredentialEmailTextField(
                        hintText: hintText, email: email, state: state),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                   var     forgoturl =
                            Platform.isAndroid ? androidForgotUrl : forgotUrl;
                        var response = await http.post(Uri.parse(forgoturl),
                            body: {'email': email.text});
                        if (response.statusCode == 200) {
                          authBloc.add(ForgetEvent());

                          // ignore: use_build_context_synchronously
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/reset', (route) => true,
                              arguments: email.text);
                        } else {
                          var error = jsonDecode(response.body);
                          print(error);
                          var errorResponse = ForgotAuthError.fromJson(error);
                          if (errorResponse.emailError.contains(emptyEmail) ||
                              errorResponse.emailError
                                  .contains(uniqueEmailError)) {
                            authBloc.add(ForgetErrorsEvent(
                                emailError: errorResponse.emailError));
                          } else if (errorResponse.emailError
                              .contains(invalidEmail)) {
                            authBloc.add(ForgetErrorsEvent(
                                emailError: errorResponse.emailError));
                          }
                        }
                      },
                      child: Container(
                        height: size.height / 12.5,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: const Color(onBoardingButtonColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          continueButton,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
