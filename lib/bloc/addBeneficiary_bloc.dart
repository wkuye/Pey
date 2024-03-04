import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/classes/addBen_event.dart';
// ignore: unused_import
import 'package:pey_ltd_mobile/classes/addBen_state.dart';

class addBeneficiaryBloc extends Bloc<AddBeneificaryEvent, TextEditingController> {
  addBeneficiaryBloc() : super(TextEditingController()) {
    on<getNames>((event, emit) => emit(TextEditingController(text: event.name)));
  }
}
