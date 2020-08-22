import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes/shared/shared.dart';

class AppSystemManager {
  static void systemBarColor(Color statusColor, Color navColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusColor, //top bar color
      statusBarIconBrightness: (statusColor != Colors.white )
          ? Brightness.light
          : Brightness.dark, //top bar icons
      systemNavigationBarColor: navColor, //bottom bar color
      systemNavigationBarIconBrightness:
          (navColor != grey)
              ? Brightness.light
              : Brightness.dark, //bottom bar icons
    ));
  }

  static void systemBarColorCustom(Color statusColor, Color navColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusColor, //top bar color
      statusBarIconBrightness: (statusColor != Colors.white )
          ? Brightness.light
          : Brightness.dark, //top bar icons
      systemNavigationBarColor: navColor, //bottom bar color
      systemNavigationBarIconBrightness:
      (navColor != Colors.white)
          ? Brightness.light
          : Brightness.dark, //bottom bar icons
    ));
  }

  static void showBar(bool showStatusBar, bool showNavBar) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    if (showStatusBar == true && showNavBar == true) {
      //default-nya muncul
    } else if (showStatusBar == true && showNavBar == false) {
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    } else if (showStatusBar == false && showNavBar == true) {
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    } else {
      SystemChrome.setEnabledSystemUIOverlays([]);
    }
  }

//  static void customOrientation () {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent, //top bar color
//      statusBarIconBrightness: Brightness.light, //top bar icons
//      systemNavigationBarColor: Colors.primaryColor, //bottom bar color
//      systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
//    ));
////    SystemChrome.setEnabledSystemUIOverlays([]); //hide status and nav bar
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//    ]);
//  }

}
