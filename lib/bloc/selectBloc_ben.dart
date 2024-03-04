import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:pey_ltd_mobile/api/http_request/getBeneficiary.dart';
import 'package:pey_ltd_mobile/classes/selectBen_event.dart';

class selectBloc extends Bloc<selectEvent, List<dynamic>> {
  selectBloc() : super([]) {
    on<selectedBenEvent>((event, emit) => emit(event.list));
    on<getBenEvent>((event, emit) => emit(event.list));
  }
}
