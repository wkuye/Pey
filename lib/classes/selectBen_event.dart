abstract class selectEvent {}

class selectedBenEvent extends selectEvent {
  final List<dynamic> list;

  selectedBenEvent({required this.list});
}

class getBenEvent extends selectEvent{
  final List<dynamic> list;

  getBenEvent({required this.list});

}