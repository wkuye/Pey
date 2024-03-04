import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/http_request/forgot_auth.dart';
import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';
import 'package:pey_ltd_mobile/bloc/password_Bloc.dart';
import 'package:pey_ltd_mobile/classes/auth_state.dart';
import 'package:pey_ltd_mobile/classes/password_state.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/utility/credentialTextField.dart';

class ForgotScreen extends StatefulWidget {
  ForgotScreen({
    super.key,
  });

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
    final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

    final String email = ModalRoute.of(context)!.settings.arguments.toString();
    final bool minState = context.watch<AuthBloc>().state.min;
    final bool matchState = context.watch<AuthBloc>().state.match;
    return BlocBuilder<AuthBloc, AuthState>(builder: (authcontext, authstate) {
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
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: BlocBuilder<PassWordBloc, PassWordState>(
                      builder: (passContext, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
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
                          flex: 3,
                        ),
                        const Text(
                          newCredentials,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(authstate.min == true ? wrong : right),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              minPass,
                              style:
                                  TextStyle(color: Color(textFieldTitleColor)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(authstate.match ? wrong : right),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 18),
                                child: const Text(
                                  matchPass,
                                  style: TextStyle(
                                    color: Color(textFieldTitleColor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            newPassword,
                            style: TextStyle(color: Color(textFieldTitleColor)),
                          ),
                        ),
                        NewCredentialPassword(
                          hintText: hintPassword,
                          state: state,
                          password: password,
                          authState: authstate,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        ConfirmCredentialPassword(
                            hintText: hintPassword,
                            state: state,
                            password: confirmPassword,
                            authState: authstate),
                        const Spacer(
                          flex: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            ForgotAuth(
                                    passWord: password,
                                    newPassword: confirmPassword,
                                    context: context,
                                    email: email,
                                    authState: authstate,
                                    min: minState, match: matchState)
                                .request();
                            print('minStates: $minState');
                          },
                          child: Container(
                            height: size.height / 12.5,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: const Color(onBoardingButtonColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              submit,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        )
                      ],
                    );
                  }))),
        ),
      );
    });
  }
}
