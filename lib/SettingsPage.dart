//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'UIManipulation.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  Color color1 = Color(0xff031927);
  Color color2 = Color(0xff9dd1f1);
  Color color3 = Color(0xff508aa8);

  List<Color> firstPalette = [
    Color(0xff031927),
    Color(0xff508aa8),
    Color(0xff9dd1f1),
    Color(0xffc8e0f4)
  ];


  Future<String> get idkPath async {
    late final directory;
    if (UIManipulation.isMobile()) {
      directory = await getApplicationDocumentsDirectory();
    } else {

    }
print(directory.path);

    return directory.path;
  }

//Tomorrow lets try and figure out the loading system, or we manually set it every time it opens



  Widget colorPaletteChoice() {

    return GestureDetector(
      onTap: () async {
      final idk = await idkPath;
      print("Hello");
      print(idkPath.toString());
      },
      child:Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        padding: EdgeInsets.only(
            left: 0,
            top: UIManipulation.getScreenWidthPix(context) * UIManipulation.getPlatformFac(0.005, 0.0001),
            right: 0,
            bottom: UIManipulation.getScreenWidthPix(context) * UIManipulation.getScreenWidthPix(context) * UIManipulation.getPlatformFac(0.005, 0.0001)),
        height: UIManipulation.getScreenHeightPix(context) * UIManipulation.getPlatformFac(0.2, 0.15),
        width: UIManipulation.getScreenWidthPix(context) * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: firstPalette[0],
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.zero, left: Radius.circular(20)),
                  ),
                )),
            Flexible(
                child: Container(
                  color: firstPalette[1],
                )),
            Flexible(
                child: Container(
                  color: firstPalette[2],
                )),
            Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: firstPalette[3],
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(20), left: Radius.zero),
                  ),
                )),
          ],
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: 0,
              top: UIManipulation.getScreenWidthPix(context) * UIManipulation.getPlatformFac(0.2, 0.05),
              right: 0,
              bottom: 0),
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                      fontSize:
                          UIManipulation.getScreenHeightPix(context) *  UIManipulation.getPlatformFac(0.2, 0.1),
                      color: Colors.black),
                ),
                colorPaletteChoice(),
                colorPaletteChoice()
              ],
            ),
          )),
    );
    return Container(
      child: Text("Settings"),
    );
  }
}
