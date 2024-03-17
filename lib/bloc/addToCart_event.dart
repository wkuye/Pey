import 'package:palette_generator/palette_generator.dart';

abstract class AddCartEvent {}

class AddToCart extends AddCartEvent {
  final bool add;

  AddToCart({required this.add});
}

class GetPallette extends AddCartEvent {
  final PaletteGenerator palette;


  GetPallette({required this.palette,});
}

class PalletteComplete extends AddCartEvent{
  final bool palettteComplete;
  final PaletteGenerator palette;
  PalletteComplete( {required this.palettteComplete,required this.palette});
}
