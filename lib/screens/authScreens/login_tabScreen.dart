import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/http_request/Login_auth.dart';
import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';

import 'package:pey_ltd_mobile/classes/auth_state.dart';
import 'package:pey_ltd_mobile/classes/password_state.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pey_ltd_mobile/utility/credentialTextField.dart';


class LoginTabScreen extends StatefulWidget {
  final PassWordState state;
  final AuthState authState;
  const LoginTabScreen(
      {super.key, required this.state, required this.authState});

  @override
  State<LoginTabScreen> createState() => _LoginTabScreenState();
}

class _LoginTabScreenState extends State<LoginTabScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
     final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;
    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                textFieldTitle1,
                style: TextStyle(color: Color(textFieldTitleColor)),
              ),
            ),
            LoginCredentialEmailTextField(
                hintText: hintText, email: email, state: widget.authState),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                textFieldTitle2,
                style: TextStyle(color: Color(textFieldTitleColor)),
              ),
            ),
            LoginCredentialPassword(
                hintText: hintPassword,
                state: widget.state,
                password: password,
                authState: widget.authState),
            const Spacer(
              flex: 3,
            ),
            GestureDetector(
              onTap: () {
                LoginAuth(
                        email: email.text,
                        password: password.text,
                        authBloc: authBloc,
                        context: context, prefs: _prefs)
                    .loginRequest();
              },
              child: Container(
                height: size.height / 15,
                width: size.width,
                decoration: BoxDecoration(
                    color: const Color(
                      onBoardingButtonColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                            child:widget.authState.loading?const CircularProgressIndicator(color: Colors.white,strokeWidth: 3,): const Text(
                              continueButton,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
              ),
            ),
            const Spacer(),
            Center(
                child: GestureDetector(
              onTap: () =>
             Navigator.pushNamedAndRemoveUntil(
              context,
              '/forgot',
              (route) => true,
            ),
              
              child: const Text(
                forgottenpassword,
                style: TextStyle(
                    color: Color(
                      onBoardingButtonColor,
                    ),
                    fontWeight: FontWeight.bold),
              ),
            )),
            const Spacer(),
            const Center(
              child: Text(
                signInWith,
                style: TextStyle(
                    color: Color(
                      textFieldTitleColor,
                    ),
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 5,
                ),
                Container(
                  height: size.height / 10,
                  width: size.width / 10,
                  decoration:  BoxDecoration(
                      image: DecorationImage(image: AssetImage(themeBool?appleLight:apple))),
                ),
                const Spacer(),
                Container(
                  height: size.height / 10,
                  width: size.width / 10,
                  decoration:  BoxDecoration(
                      image: DecorationImage(image: AssetImage(themeBool?facebookLight:facebook))),
                ),
                const Spacer(),
                Container(
                  height: size.height / 10,
                  width: size.width / 10,
                  decoration:  BoxDecoration(
                      image: DecorationImage(image: AssetImage(themeBool?twitterLight:twitter))),
                ),
                const Spacer(
                  flex: 5,
                )
              ],
            ),
            const Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
