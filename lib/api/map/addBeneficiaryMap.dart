import 'dart:collection';

class BeneficiaryMap extends MapView {
  final String email;
   BeneficiaryMap({required this.email}) : super({
    'email':email
  });
}
