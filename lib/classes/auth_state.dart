class AuthState {
  final bool loading;
  final bool min;
  final bool match;
  final String loginEmailResponse;
  final String loginPasswordResonse;
  final String emailErrorResponse;
  final String nameErrorResposnse;
  final String lastNameErrorResponse;
  final String passwordErrorResponse;
  final String forgotEmailErrorResponse;
  final String forgotPasswordErrorResponse;
  final String forgotconfirmPasswordErrorResponse;

  AuthState(
      {required this.loading,
      required this.loginPasswordResonse,
      required this.loginEmailResponse,
      required this.emailErrorResponse,
      required this.lastNameErrorResponse,
      required this.nameErrorResposnse,
      required this.passwordErrorResponse,
      required this.forgotEmailErrorResponse,
      required this.forgotPasswordErrorResponse,
      required this.forgotconfirmPasswordErrorResponse,
      required this.match,
      required this.min});
}
