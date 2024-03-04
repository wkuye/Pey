import 'dart:collection';

class LoginApi extends MapView {
  final String email;
  final String password;
  LoginApi({required this.email, required this.password}) : super({
'email':email,
'password':password

  });
}
