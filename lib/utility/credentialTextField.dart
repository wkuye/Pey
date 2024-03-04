// ignore: file_names
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/error/error_Strings.dart';

import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';
import 'package:pey_ltd_mobile/bloc/password_Bloc.dart';

import 'package:pey_ltd_mobile/classes/auth_state.dart';
import 'package:pey_ltd_mobile/classes/passWord_event.dart';
import 'package:pey_ltd_mobile/classes/password_state.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

class CredentialEmailTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController email;
  final AuthState state;

  const CredentialEmailTextField({
    super.key,
    required this.hintText,
    required this.email,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error = BlocProvider.of<AuthBloc>(context).state.emailErrorResponse;
        final themeColors = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;

    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ? themeColors.cardColor
                  : themeColors.cardColor,
              // backgroundBlendMode: BlendMode.dst,
border: themeBool?Border.all():null,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: email,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border: OutlineInputBorder(
                gapPadding: Platform.isAndroid ? 9 : 4,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              focusedBorder: OutlineInputBorder(
                gapPadding: Platform.isAndroid ? 7 : 4,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (state.emailErrorResponse.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              right: 151,
              top: 8,
            ),
            child: Text(
              BlocProvider.of<AuthBloc>(context).state.emailErrorResponse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class CredentialFirstNameTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController firstName;
  final AuthState state;
  const CredentialFirstNameTextField(
      {super.key,
      required this.hintText,
      required this.firstName,
      required this.state});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error = BlocProvider.of<AuthBloc>(context).state.nameErrorResposnse;
    
    final themeColors = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;

    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ? themeColors.cardColor
                  : themeColors.cardColor,
                  border: themeBool?Border.all():null,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: firstName,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border:
                  OutlineInputBorder(gapPadding: Platform.isAndroid ? 9 : 4),
              focusedBorder: OutlineInputBorder(
                gapPadding: Platform.isAndroid ? 7 : 4,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (state.nameErrorResposnse.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              right: 150,
              top: 8,
            ),
            child: Text(
              BlocProvider.of<AuthBloc>(context).state.nameErrorResposnse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class CredentialLastNameTextField extends StatelessWidget {
  final String hintText;
  final AuthState state;
  final TextEditingController lastName;
  const CredentialLastNameTextField(
      {super.key,
      required this.hintText,
      required this.lastName,
      required this.state});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error = BlocProvider.of<AuthBloc>(context).state.lastNameErrorResponse;
    final themeColors = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;

    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ?themeColors.cardColor
                  : themeColors.cardColor,
                  border: themeBool?Border.all():null,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: lastName,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border:
                  OutlineInputBorder(gapPadding: Platform.isAndroid ? 9 : 4),
              focusedBorder: OutlineInputBorder(
                gapPadding: Platform.isAndroid ? 7 : 4,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (state.lastNameErrorResponse.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              right: 120,
              top: 8,
            ),
            child: Text(
              BlocProvider.of<AuthBloc>(context).state.lastNameErrorResponse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class CredentialPassword extends StatelessWidget {
  final String hintText;
  final PassWordState state;
  final AuthState authState;
  final TextEditingController password;
  const CredentialPassword(
      {super.key,
      required this.hintText,
      required this.state,
      required this.password,
      required this.authState});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error = BlocProvider.of<AuthBloc>(context).state.passwordErrorResponse;
        final themeColors = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;

    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ? themeColors.cardColor
                  : themeColors.cardColor,
                  border: themeBool?Border.all():null,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: password,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.visiblePassword,
            obscureText: state.obscure ? true : false,
            onTap: () {
              context.read<PassWordBloc>().add(Enabled());
            },
            onFieldSubmitted: (value) {
              context.read<PassWordBloc>().add(OnDone());
              context
                  .read<PassWordBloc>()
                  .add(Disabled(text: value.toString()));
            },
            decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(
                minWidth: 2,
                minHeight: 2,
                maxWidth: size.width / 5.6,
              ),
              suffixIcon: Row(
                children: [
                  Icon(
                    state.isEnabled && !state.isDone ? Icons.cancel : null,
                    color: error.isNotEmpty ? Colors.red : null,
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        if (state.visible == true) {
                          context.read<PassWordBloc>().add(obscure());
                        } else {
                          context.read<PassWordBloc>().add(Visible());
                        }
                      },
                      child: Icon(
                        !state.isDisabled ? Icons.visibility : null,
                        color: error.isNotEmpty ? Colors.red : null,
                      )),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (authState.passwordErrorResponse.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              right: 121,
              top: 8,
            ),
            child: Text(
              BlocProvider.of<AuthBloc>(context).state.passwordErrorResponse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class LoginCredentialEmailTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController email;
  final AuthState state;

  const LoginCredentialEmailTextField({
    super.key,
    required this.hintText,
    required this.email,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error = BlocProvider.of<AuthBloc>(context).state.loginEmailResponse;
    
    final themeColors = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;
   
    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ? themeColors.cardColor
                  : themeColors.cardColor,
              // backgroundBlendMode: BlendMode.dst,
border: themeBool?Border.all():null,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: email,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border: OutlineInputBorder(
                gapPadding: Platform.isAndroid ? 9 : 4,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              focusedBorder: OutlineInputBorder(
                gapPadding: Platform.isAndroid ? 7 : 4,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (state.loginEmailResponse.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
              right: error.contains(uniqueEmailError) ? 20 : 151,
              top: 8,
            ),
            child: Text(
              BlocProvider.of<AuthBloc>(context).state.loginEmailResponse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class LoginCredentialPassword extends StatelessWidget {
  final String hintText;
  final PassWordState state;
  final AuthState authState;
  final TextEditingController password;
  const LoginCredentialPassword(
      {super.key,
      required this.hintText,
      required this.state,
      required this.password,
      required this.authState});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error = BlocProvider.of<AuthBloc>(context).state.loginPasswordResonse;
     
    final themeColors = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;
   
    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ? themeColors.cardColor
                  : themeColors.cardColor,
                  border: themeBool?Border.all():null,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: password,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.visiblePassword,
            obscureText: state.obscure ? true : false,
            onTap: () {
              context.read<PassWordBloc>().add(Enabled());
            },
            onFieldSubmitted: (value) {
              context.read<PassWordBloc>().add(OnDone());
              context
                  .read<PassWordBloc>()
                  .add(Disabled(text: value.toString()));
            },
            decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(
                minWidth: 2,
                minHeight: 2,
                maxWidth: size.width / 5.6,
              ),
              suffixIcon: Row(
                children: [
                  Icon(
                    state.isEnabled && !state.isDone ? Icons.cancel : null,
                    color: error.isNotEmpty ? Colors.red : null,
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        if (state.visible == true) {
                          context.read<PassWordBloc>().add(obscure());
                        } else {
                          context.read<PassWordBloc>().add(Visible());
                        }
                      },
                      child: Icon(
                        !state.isDisabled ? Icons.visibility : null,
                        color: error.isNotEmpty ? Colors.red : null,
                      )),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (authState.loginPasswordResonse.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
                right: authState.loginPasswordResonse.contains(invalidPassword)
                    ? 212
                    : 121,
                top: 8,
                bottom: 8),
            child: Text(
              BlocProvider.of<AuthBloc>(context).state.loginPasswordResonse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class ForgotCredentialEmailTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController email;
  final AuthState state;

  const ForgotCredentialEmailTextField({
    super.key,
    required this.hintText,
    required this.email,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error =
        BlocProvider.of<AuthBloc>(context).state.forgotEmailErrorResponse;
    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ? const Color(errorInputColor)
                  : const Color(textFieldColor),
              // backgroundBlendMode: BlendMode.dst,

              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: email,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border: OutlineInputBorder(
                gapPadding: Platform.isAndroid ? 9 : 4,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              focusedBorder: OutlineInputBorder(
                gapPadding: Platform.isAndroid ? 7 : 4,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (state.forgotEmailErrorResponse.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
              right: error.contains(uniqueEmailError) ? 20 : 151,
              top: 8,
            ),
            child: Text(
              BlocProvider.of<AuthBloc>(context).state.forgotEmailErrorResponse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class NewCredentialPassword extends StatelessWidget {
  final String hintText;
  final PassWordState state;
  final AuthState authState;
  final TextEditingController password;
  const NewCredentialPassword(
      {super.key,
      required this.hintText,
      required this.state,
      required this.password,
      required this.authState});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error =
        BlocProvider.of<AuthBloc>(context).state.forgotPasswordErrorResponse;
    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ? const Color(errorInputColor)
                  : const Color(textFieldColor),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: password,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.visiblePassword,
            obscureText: state.obscure ? true : false,
            onTap: () {
              context.read<PassWordBloc>().add(Enabled());
            },
            onFieldSubmitted: (value) {
              context.read<PassWordBloc>().add(OnDone());
              context
                  .read<PassWordBloc>()
                  .add(Disabled(text: value.toString()));
             
            },
            decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(
                minWidth: 2,
                minHeight: 2,
                maxWidth: size.width / 5.6,
              ),
              suffixIcon: Row(
                children: [
                  Icon(
                    state.isEnabled && !state.isDone ? Icons.cancel : null,
                    color: error.isNotEmpty ? Colors.red : null,
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        if (state.visible == true) {
                          context.read<PassWordBloc>().add(obscure());
                        } else {
                          context.read<PassWordBloc>().add(Visible());
                        }
                      },
                      child: Icon(
                        !state.isDisabled ? Icons.visibility : null,
                        color: error.isNotEmpty ? Colors.red : null,
                      )),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (authState.forgotPasswordErrorResponse.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
                right: authState.forgotPasswordErrorResponse
                        .contains(invalidPassword)
                    ? 212
                    : 121,
                top: 8,
                bottom: 8),
            child: Text(
              BlocProvider.of<AuthBloc>(context)
                  .state
                  .forgotPasswordErrorResponse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class ConfirmCredentialPassword extends StatelessWidget {
  final String hintText;
  final PassWordState state;
  final AuthState authState;
  final TextEditingController password;
  const ConfirmCredentialPassword(
      {super.key,
      required this.hintText,
      required this.state,
      required this.password,
      required this.authState});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var error =
        BlocProvider.of<AuthBloc>(context).state.forgotconfirmPasswordErrorResponse;
    return Column(
      children: [
        Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
              color: error.isNotEmpty
                  ? const Color(errorInputColor)
                  : const Color(textFieldColor),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: password,
            cursorColor: const Color(onBoardingButtonColor),
            style: const TextStyle(color: Color(hintTextColor)),
            keyboardType: TextInputType.visiblePassword,
            obscureText: state.obscure ? true : false,
            onTap: () {
              context.read<PassWordBloc>().add(Enabled());
            },
            onFieldSubmitted: (value) {
              context.read<PassWordBloc>().add(OnDone());
              context
                  .read<PassWordBloc>()
                  .add(Disabled(text: value.toString()));
            },
            decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(
                minWidth: 2,
                minHeight: 2,
                maxWidth: size.width / 5.6,
              ),
              suffixIcon: Row(
                children: [
                  Icon(
                    state.isEnabled && !state.isDone ? Icons.cancel : null,
                    color: error.isNotEmpty ? Colors.red : null,
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        if (state.visible == true) {
                          context.read<PassWordBloc>().add(obscure());
                        } else {
                          context.read<PassWordBloc>().add(Visible());
                        }
                      },
                      child: Icon(
                        !state.isDisabled ? Icons.visibility : null,
                        color: error.isNotEmpty ? Colors.red : null,
                      )),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: error.isNotEmpty
                      ? Colors.red
                      : const Color(hintTextColor)),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: error.isNotEmpty
                      ? const BorderSide(color: Colors.red)
                      : BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(onBoardingButtonColor),
                    width: 1), // Border color when focused
              ),
            ),
          ),
        ),
        if (authState.forgotconfirmPasswordErrorResponse.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
                right: authState.forgotconfirmPasswordErrorResponse
                        .contains(invalidPassword)
                    ? 212
                    : 121,
                top: 8,
                bottom: 8),
            child: Text(
              BlocProvider.of<AuthBloc>(context)
                  .state
                  .forgotconfirmPasswordErrorResponse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
