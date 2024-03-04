import 'package:bloc/bloc.dart';
import 'package:pey_ltd_mobile/classes/passWord_event.dart';
import 'package:pey_ltd_mobile/classes/password_state.dart';

class PassWordBloc extends Bloc<PassWordEvent, PassWordState> {
  PassWordBloc()
      : super(PassWordState(
            isEnabled: false,
            isDisabled: true,
            isDone: false,
            visible: false,
            obscure: true)) {
    on<Enabled>((event, emit) {
    if (state.obscure==true) {
          emit(PassWordState(
          isEnabled: true,
          isDisabled: false,
          isDone: false,
          visible: false,
          obscure: true));
      }
      if (state.visible) {
         emit(PassWordState(
          isEnabled: true,
          isDisabled: false,
          isDone: false,
          visible: true,
          obscure: false));
      }
    });
    on<Disabled>((event, emit) {
      if (event.text.isEmpty) {
        emit(PassWordState(
            isEnabled: false,
            isDisabled: true,
            isDone: false,
            visible: false,
            obscure: true));
      }
    });
    on<OnDone>((event, emit) {
      if (state.obscure == true) {
        emit(PassWordState(
            isEnabled: false,
            isDisabled: false,
            isDone: true,
            visible: false,
            obscure: true));
      }
      if (state.visible == true) {
        emit(PassWordState(
            isEnabled: false,
            isDisabled: false,
            isDone: true,
            visible: true,
            obscure: false));
      }
    });
    on<Visible>((event, emit) {
      if (state.isEnabled == true) {
        emit(PassWordState(
            isEnabled: true,
            isDisabled: false,
            isDone: false,
            visible: true,
            obscure: false));
      }
      if (state.isDone == true) {
        emit(PassWordState(
            isEnabled: false,
            isDisabled: false,
            isDone: true,
            visible: true,
            obscure: false));
      }
    });
    on<obscure>((event, emit) {
      if (state.isEnabled == true) {
        emit(PassWordState(
            isEnabled: true,
            isDisabled: false,
            isDone: false,
            visible: false,
            obscure: true));
      }
      if (state.isDone == true) {
        emit(PassWordState(
            isEnabled: false,
            isDisabled: false,
            isDone: true,
            visible: false,
            obscure: true));
      }
    });
  }
}
