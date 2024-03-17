import 'package:palette_generator/palette_generator.dart';

class CartState {
  final PaletteGenerator? palette;
  final bool add;
  final bool paletteComplete;

  CartState({required this.palette, required this.add, required this.paletteComplete});
}
