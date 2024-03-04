class AuthError {
  final List<String> firstNameError;
  final List<String> lastNameError;
  final List<String> emailError;
  final List<String> passwordError;
  final List<String> passwordConfirmationError;
  AuthError(this.firstNameError, this.lastNameError, this.emailError,
      this.passwordError, this.passwordConfirmationError);
  factory AuthError.fromJson(Map<String, dynamic> json) {
    return AuthError(
      json['errors']['name'] == null
          ? []
          : (json['errors']['name'] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
      json['errors']['last_name'] == null
          ? []
          : (json['errors']['last_name'] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
      json['errors']['email'] == null
          ? []
          : (json['errors']['email'] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
      json['errors']['password'] == null
          ? []
          : (json['errors']['password'] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
              json['errors']['password_confirmation'] ==null?[]:(json['errors']['password_confirmation']as List<dynamic>).map((e) => e.toString()).toList()
    );
  }
}
