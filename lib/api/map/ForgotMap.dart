import 'dart:collection';

class ForgotMap extends MapView {
  final String password;
  final String newPassword;
  final String email;

  ForgotMap({required this.password, required this.newPassword, required this.email})
      : super({'password': password, 'password_confirmation': newPassword, 'email':email}, );
}
