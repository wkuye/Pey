import 'dart:collection';

class RegisterApi extends MapView {
  final String email;
  final String firstName;
  final String lastName;
  final String passWord;
  RegisterApi({required this.email, required this.firstName, required this.lastName, required this.passWord})
      : super({
          'email': email,
          'name': firstName,
          'last_name':lastName,
          'password':passWord
        });
}
