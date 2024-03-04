class ForgotAuthError {
  final String emailError;
  final String passwordError;

  ForgotAuthError(this.emailError, this.passwordError);
  factory ForgotAuthError.fromJson(Map<String, dynamic> json) {
    return ForgotAuthError(json['message'] ?? '', json['message'] ?? '');
  }
}
