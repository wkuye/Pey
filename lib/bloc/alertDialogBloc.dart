import 'package:bloc/bloc.dart';
import 'package:pey_ltd_mobile/classes/dialogEvent.dart';

class DialogBloc extends Bloc<DialogEVent, bool> {
  DialogBloc() : super(false) {
    on<ShowDialog>((event, emit) => emit(event.dialog));

  }
}
