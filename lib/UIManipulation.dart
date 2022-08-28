
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIManipulation {

  static double getScreenHeightPix(BuildContext cont) {
    return MediaQuery
        .of(cont)
        .size
        .height;
  }

  static double getScreenWidthPix(BuildContext cont) {
    return MediaQuery
        .of(cont)
        .size
        .width;
  }

  static double getWidthPix(double screenWidth, double widthFac) {
    return screenWidth * widthFac;
  }

  static double getHeightPix(double screenHeight, double heightFac) {
    return screenHeight * heightFac;
  }

  static double getPlatformFac(double webVal, double mobileVal) {
    if (kIsWeb) {
      return webVal;
    } else {
      return mobileVal;
    }
  }

  static double calcFacorPix(double mainAxisVal, double crossAxisVal,
      double crossAxisFrac, bool Pix) {
    if (Pix) {
      //Pixels
      return (crossAxisVal / crossAxisFrac);
    } else {
      //Fac
      return (crossAxisVal / crossAxisFrac) / mainAxisVal;
    }
  }

  static bool isMobile () {

    if (kIsWeb) {
      return false;
    } else {
      return true;
    }
  }

  static Color ColorChoice (Color cl1, Color cl2, int choice) {

   //This is mostly used for white or black
      switch (choice) {
        case 0:
          //White
        return cl1;
        case 1:
        //White
          return cl1;
        case 2:
          return cl2;
        case 3:
          return cl2;
        case 4:
          return cl2;
        case 5:
          return cl2;
        case 6:
        //White
          return cl1;
        default:
          return cl1;
      }
  }


/*
 double _CalcHeightFac() {
   double screenHeight = MediaQuery.of(context).size.height;
   double cardWidth =
   ((MediaQuery.of(context).size.width * _GetWidthFac()) / 5);
   return (cardWidth) / screenHeight;
 }

 */


}