import 'dart:collection';

class TransferMap extends MapView {
  // ignore: non_constant_identifier_names
  final String recepient_id;
  final dynamic amount;
  final dynamic type;
  final String description;
  TransferMap(
      {required this.recepient_id,
      required this.amount,
      required this.type,
      required this.description})
      : super({
          'recipient_id': recepient_id,
          'amount': amount,
          'type': type,
          'description': description
        });
}
