abstract class AddBeneificaryEvent {}

class getNames extends AddBeneificaryEvent {
  final String name;
  

  getNames({required this.name});
}
