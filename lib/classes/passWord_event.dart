abstract class PassWordEvent {}

class Enabled extends PassWordEvent {}

class Disabled extends PassWordEvent {
  final String text;

  Disabled({ required this.text});
}

class OnDone extends PassWordEvent {
 
}

class Visible extends PassWordEvent{
  
}

class obscure extends PassWordEvent{
  
}
