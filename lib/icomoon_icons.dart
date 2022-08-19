// Place fonts/icomoon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: icomoon
//      fonts:
//       - asset: fonts/icomoon.ttf
import 'package:flutter/widgets.dart';

class Icomoon {
  Icomoon._();

  static const String _fontFamily = 'icomoon';

  static const IconData globe = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData wordle = IconData(0xeac9, fontFamily: _fontFamily);
  static const IconData settings = IconData(0xe995, fontFamily: _fontFamily);

}
