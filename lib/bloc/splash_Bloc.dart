import 'package:bloc/bloc.dart';
import 'package:pey_ltd_mobile/classes/%20splash_state.dart';
import 'package:pey_ltd_mobile/classes/splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc()
      : super(SplashState(isDone: false, loading: true, isBlur: false)) {
    on<Blur>((event, emit) =>
        emit(SplashState(isDone: false, loading: false, isBlur: true)));
    on<Done>((event, emit) =>
        emit(SplashState(isDone: true, loading: false, isBlur: false)));
  }
}
