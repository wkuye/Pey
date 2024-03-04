import 'package:pey_ltd_mobile/api/models/user.dart';

abstract class UserEvent {}

class UserDetails extends UserEvent {
  final User user;
  final bool isLoggedIn;

  UserDetails({required this.user, required this.isLoggedIn});
  
}
