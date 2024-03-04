// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/http_request/Register_auth.dart';

import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';
import 'package:pey_ltd_mobile/classes/auth_state.dart';
import 'package:pey_ltd_mobile/classes/password_state.dart';
import 'package:pey_ltd_mobile/utility/credentialTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/strings.dart';

class RegisterTabScreen extends StatefulWidget {
  final PassWordState state;
  final AuthState authState;
  const RegisterTabScreen(
      {super.key, required this.state, required this.authState});

  @override
  State<RegisterTabScreen> createState() => _RegisterTabScreenState();
}

class _RegisterTabScreenState extends State<RegisterTabScreen> {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController email = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    
    return ListView(
        physics: const ClampingScrollPhysics(),
        itemExtent: authBloc.state.emailErrorResponse.isNotEmpty||authBloc.state.lastNameErrorResponse.isNotEmpty || authBloc.state.nameErrorResposnse.isNotEmpty || authBloc.state.passwordErrorResponse.isNotEmpty?  size.height/1.28:size.height / 1.3,
        shrinkWrap: true,
        children: [
          Form(
            key: formKey,
            child: Material(
                type: MaterialType.transparency,
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          textFieldTitle3,
                          style: TextStyle(color: Color(textFieldTitleColor)),
                        ),
                      ),
                      
                      CredentialEmailTextField(
                        hintText: hintText,
                        email: email,
                        state: widget.authState,
                      ),
                      const SizedBox(height: 8,),
                      const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          textFieldTitle4,
                          style: TextStyle(color: Color(textFieldTitleColor)),
                        ),
                      ),
                      CredentialFirstNameTextField(
                        hintText: hintText1,
                        firstName: firstName,
                        state: widget.authState,
                      ),
                      const SizedBox(height:8,),
                      const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          textFieldTitle5,
                          style: TextStyle(color: Color(textFieldTitleColor)),
                        ),
                      ),
                      CredentialLastNameTextField(
                        hintText: hintText2,
                        lastName: lastName,
                        state: widget.authState,
                      ),
                      const SizedBox(height: 8,),
                      const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          textFieldTitle2,
                          style: TextStyle(color: Color(textFieldTitleColor)),
                        ),
                      ),
                      CredentialPassword(
                        hintText: hintPassword,
                        state: widget.state,
                        password: password,
                        authState: widget.authState,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () async {
                          RegisterAuthRequest(
                                  authBloc: authBloc,
                                  email: email.text,
                                  firstName: firstName.text,
                                  formKey: formKey,
                                  lastName: lastName.text,
                                  password: password.text,
                                  state: widget.authState,
                                  context: context, prefs: _prefs, )
                              .registerRequest();
       
                          // ignore: invalid_use_of_protected_member
                        },
                        child: Container(
                          height: size.height / 15,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: const Color(
                                onBoardingButtonColor,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child:  Center(
                            child:widget.authState.loading?const CircularProgressIndicator(color: Colors.white,strokeWidth: 3,): const Text(
                              continueButton,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       const Center(
                          child:  Text(
                        termsAndCondition,
                        style: TextStyle(
                            color: Color(
                              onBoardingButtonColor,
                            ),
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                )),
          ),
        ]);
  }
}
