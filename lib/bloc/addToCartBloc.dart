import 'package:bloc/bloc.dart';
import 'package:pey_ltd_mobile/bloc/addToCartState.dart';
import 'package:pey_ltd_mobile/bloc/addToCart_event.dart';

class AddToCartBloc extends Bloc<AddCartEvent, CartState> {
  AddToCartBloc()
      : super(CartState(add: false, palette: null, paletteComplete: false)) {
    on<AddToCart>((event, emit) {});
    on<GetPallette>((event, emit) => emit(CartState(
          palette: event.palette,
          add: false,
          paletteComplete: true,
        )));
    on<PalletteComplete>((event, emit) => emit(CartState(
        palette: event.palette,
        add: false,
        paletteComplete: event.palettteComplete)));
  }
}
