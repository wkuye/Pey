import 'package:bloc/bloc.dart';

import 'package:pey_ltd_mobile/classes/auth_event.dart';
import 'package:pey_ltd_mobile/classes/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(AuthState(
          loading: false,
          emailErrorResponse: '',
          lastNameErrorResponse: '',
          nameErrorResposnse: '',
          passwordErrorResponse: '',
          loginPasswordResonse: '',
          loginEmailResponse: '',
          forgotEmailErrorResponse: '',
          forgotPasswordErrorResponse: '',
          forgotconfirmPasswordErrorResponse: '',
          match: true,
          min: true,
        )) {
    on<Loading>((event, emit) => emit(AuthState(
        loading: true,
        emailErrorResponse: '',
        lastNameErrorResponse: '',
        nameErrorResposnse: '',
        passwordErrorResponse: '',
        loginPasswordResonse: '',
        loginEmailResponse: '',
        forgotEmailErrorResponse: '',
        forgotPasswordErrorResponse: '',
        forgotconfirmPasswordErrorResponse: '',
        match: true,
        min: true)));
    on<Register>((event, emit) => emit(AuthState(
          loading: false,
          emailErrorResponse: '',
          lastNameErrorResponse: '',
          nameErrorResposnse: '',
          passwordErrorResponse: '',
          loginPasswordResonse: '',
          loginEmailResponse: '',
          forgotEmailErrorResponse: '',
          forgotPasswordErrorResponse: '',
          forgotconfirmPasswordErrorResponse: '',
          match: false,
          min: true,
        )));
    on<ErrorEvent>((event, emit) => emit(AuthState(
          loading: false,
          emailErrorResponse: event.emailError,
          lastNameErrorResponse: event.lastnameError,
          nameErrorResposnse: event.nameError,
          passwordErrorResponse: event.passwordError,
          loginPasswordResonse: '',
          loginEmailResponse: '',
          forgotEmailErrorResponse: '',
          forgotPasswordErrorResponse: '',
          forgotconfirmPasswordErrorResponse: '',
          match: true,
          min: true,
        )));

    on<FirstNameEvent>((event, emit) => emit(AuthState(
          loading: false,
          emailErrorResponse: event.emailError,
          lastNameErrorResponse: event.lastnameError,
          nameErrorResposnse: event.nameError,
          passwordErrorResponse: event.passwordError,
          loginPasswordResonse: '',
          loginEmailResponse: '',
          forgotEmailErrorResponse: '',
          forgotPasswordErrorResponse: '',
          forgotconfirmPasswordErrorResponse: '',
          match: true,
          min: true,
        )));

    on<LastNameEvent>((event, emit) => emit(AuthState(
          loading: false,
          emailErrorResponse: event.emailError,
          lastNameErrorResponse: event.lastnameError,
          nameErrorResposnse: event.nameError,
          passwordErrorResponse: event.passwordError,
          loginPasswordResonse: '',
          loginEmailResponse: '',
          forgotEmailErrorResponse: '',
          forgotPasswordErrorResponse: '',
          forgotconfirmPasswordErrorResponse: '',
          match: true,
          min: true,
        )));

    on<PasswordEvent>((event, emit) => emit(AuthState(
          loading: false,
          emailErrorResponse: event.emailError,
          lastNameErrorResponse: event.lastnameError,
          nameErrorResposnse: event.nameError,
          passwordErrorResponse: event.passwordError,
          loginPasswordResonse: '',
          loginEmailResponse: '',
          forgotEmailErrorResponse: '',
          forgotPasswordErrorResponse: '',
          forgotconfirmPasswordErrorResponse: '',
          match: true,
          min: true,
        )));

    on<Login>((event, emit) => emit(AuthState(
        loading: false,
        emailErrorResponse: '',
        lastNameErrorResponse: '',
        nameErrorResposnse: '',
        passwordErrorResponse: '',
        loginPasswordResonse: '',
        loginEmailResponse: '',
        forgotEmailErrorResponse: '',
        forgotPasswordErrorResponse: '',
        forgotconfirmPasswordErrorResponse: '',
        match: true,
        min: true)));
    on<LoginErrors>((event, emit) => emit(AuthState(
          loading: false,
          emailErrorResponse: '',
          lastNameErrorResponse: '',
          nameErrorResposnse: '',
          passwordErrorResponse: '',
          loginPasswordResonse: event.passwordError,
          loginEmailResponse: event.emailError,
          forgotEmailErrorResponse: '',
          forgotPasswordErrorResponse: '',
          forgotconfirmPasswordErrorResponse: '',
          match: true,
          min: true,
        )));
    on<ForgetErrorsEvent>((event, emit) => emit(
          AuthState(
              loading: false,
              loginPasswordResonse: '',
              loginEmailResponse: '',
              emailErrorResponse: '',
              lastNameErrorResponse: '',
              nameErrorResposnse: '',
              passwordErrorResponse: '',
              forgotPasswordErrorResponse: '',
              forgotEmailErrorResponse: event.emailError,
              forgotconfirmPasswordErrorResponse: '',
              match: true,
              min: true),
        ));
    on<ForgetEvent>((event, emit) => emit(AuthState(
        loading: false,
        loginPasswordResonse: '',
        loginEmailResponse: '',
        emailErrorResponse: '',
        lastNameErrorResponse: '',
        nameErrorResposnse: '',
        passwordErrorResponse: '',
        forgotEmailErrorResponse: '',
        forgotPasswordErrorResponse: '',
        forgotconfirmPasswordErrorResponse: '',
        match: true,
        min: true)));
    on<ForgetPasswordEvent>((event, emit) => emit(AuthState(
          loading: false,
          loginPasswordResonse: '',
          loginEmailResponse: '',
          emailErrorResponse: '',
          lastNameErrorResponse: '',
          nameErrorResposnse: '',
          passwordErrorResponse: '',
          forgotEmailErrorResponse: '',
          forgotPasswordErrorResponse: event.passwordError,
          forgotconfirmPasswordErrorResponse: event.confirmPasswordError,
          match: event.match,
          min: event.min,
        )));
    on<ResetEvent>((event, emit) => emit(AuthState(
        loading: false,
        loginPasswordResonse: '',
        loginEmailResponse: '',
        emailErrorResponse: '',
        lastNameErrorResponse: '',
        nameErrorResposnse: '',
        passwordErrorResponse: '',
        forgotEmailErrorResponse: '',
        forgotPasswordErrorResponse: '',
        forgotconfirmPasswordErrorResponse: '',
        match: event.match,
        min: event.minPassword)));
  }
}
