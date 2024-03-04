class LoginError {
  final List<String> emailErrors;
  final List<String> passwordErrors;
  final String invalidEmail;
  final String invalidPassword;

  LoginError(
    this.emailErrors,
    this.passwordErrors,
    this.invalidEmail,
    this.invalidPassword,
  );

  factory LoginError.fromJson(Map<String, dynamic> json) {
    return LoginError(
      (json['errors']?['email'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      (json['errors']?['password'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      json['message'] ?? '',
      json['message'] ?? '',
    );
  }
}

