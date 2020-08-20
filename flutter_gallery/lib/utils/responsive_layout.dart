import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQuery;
  static double screenWidth;
  static double screenHeight;

  static double blockWidth;
  static double blockHeight;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenWidth = _mediaQuery.size.width;
    screenHeight = _mediaQuery.size.height;

    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }
}
