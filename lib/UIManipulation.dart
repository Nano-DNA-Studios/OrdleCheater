
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

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


/*
 double _CalcHeightFac() {
   double screenHeight = MediaQuery.of(context).size.height;
   double cardWidth =
   ((MediaQuery.of(context).size.width * _GetWidthFac()) / 5);
   return (cardWidth) / screenHeight;
 }

 */


}