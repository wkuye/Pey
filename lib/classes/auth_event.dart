abstract class AuthEvent {}

class Register extends AuthEvent {}

class Login implements AuthEvent {}

class ErrorEvent implements AuthEvent {
  final String emailError;
  final String nameError;
  final String passwordError;
  final String lastnameError;
  ErrorEvent(
      {required this.emailError,
      required this.nameError,
      required this.passwordError,
      required this.lastnameError});
}

class FirstNameEvent implements AuthEvent {
  final String emailError;
  final String nameError;
  final String passwordError;
  final String lastnameError;
  FirstNameEvent(
      {required this.emailError,
      required this.nameError,
      required this.passwordError,
      required this.lastnameError});
}

class LastNameEvent implements AuthEvent {
  final String emailError;
  final String nameError;
  final String passwordError;
  final String lastnameError;
  LastNameEvent(
      {required this.emailError,
      required this.nameError,
      required this.passwordError,
      required this.lastnameError});
}

class PasswordEvent implements AuthEvent {
  final String emailError;
  final String nameError;
  final String passwordError;
  final String lastnameError;
  PasswordEvent(
      {required this.emailError,
      required this.nameError,
      required this.passwordError,
      required this.lastnameError});
}

class Loading implements AuthEvent {}

class LoginErrors implements AuthEvent {
  final String emailError;
  final String passwordError;
  LoginErrors({required this.emailError, required this.passwordError});
}

class ForgetEvent extends AuthEvent {
 
  
}

class ForgetErrorsEvent extends AuthEvent {
  final String emailError;
  ForgetErrorsEvent({required this.emailError});
}

class ForgetPasswordEvent extends AuthEvent {
  final bool min;
  final bool match;
  final String passwordError;
  final String confirmPasswordError;
  ForgetPasswordEvent(
      {required this.passwordError,
      required this.confirmPasswordError,
      required this.match,
      required this.min});
}
class ResetEvent extends AuthEvent{
   final bool minPassword;
  final bool match;

  ResetEvent({required this.minPassword, required this.match});
}
