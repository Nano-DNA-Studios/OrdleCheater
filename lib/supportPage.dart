import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UIManipulation.dart';
import 'allColorPalettes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'socialMediaInfo.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPage();
}

class _SupportPage extends State<SupportPage> {
  //Create a new Word Class

  List<Color> currPal = Palettes[0];
  Color textColor = Colors.white;
  int choice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getColors();
  }

  void getColors() async {
    final prefs = await SharedPreferences.getInstance();
    choice = prefs.getInt('ColorMode') ?? 0;

    setState(() {
      currPal = Palettes[choice];
      textColor =
          UIManipulation.ColorChoice(Colors.white, Colors.black, choice);
      // textColor = UIManipulation.ColorChoice(Colors.white, Colors.black, choice);
      // wordClass.textColor = UIManipulation.ColorChoice(Colors.white, Colors.black, choice);
    });
  }

  Widget getImageSec(String imagePath, bool circle) {
    if (imagePath != "") {
      if (circle) {
        return SizedBox(
            width: UIManipulation.getScreenWidthPix(context) *
                UIManipulation.getPlatformFac(0.4, 0.7),
            child: Container(
              height: UIManipulation.getScreenWidthPix(context) *
                  UIManipulation.getPlatformFac(0.4, 0.7),
              width: UIManipulation.getScreenWidthPix(context) *
                  UIManipulation.getPlatformFac(0.4, 0.7),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)),

              // child:Image.asset(imagePath, fit: BoxFit.contain, ) ,
            ));
      } else {
        return SizedBox(
            width: UIManipulation.getScreenWidthPix(context) *
                UIManipulation.getPlatformFac(0.4, 0.7),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ));
      }
      //return an image widget

    } else {
      return Container();
    }
  }

  Widget textTab(String title, String info, String imagePath, bool circle) {
    return Container(
      width: UIManipulation.getScreenWidthPix(context) *
          UIManipulation.getPlatformFac(0.6, 0.9),
      margin: const EdgeInsets.only(
        bottom: 20,
        top: 20,
      ),
      //width: UIManipulation.getScreenWidthPix(context) * UIManipulation.getPlatformFac(0.6, 0.9),
      // height: UIManipulation.getScreenHeightPix(context) * UIManipulation.getPlatformFac(0.8, 0.9),
      // color: currPal[1],
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        color: currPal[1],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: platformFontSize(false), color: textColor),
            textAlign: TextAlign.center,
          ),
          getImageSec(imagePath, circle),
          Text(
            info,
            style: TextStyle(
              fontSize: platformFontSize(true),
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget socialMediaTab() {
    return Container(
      width: UIManipulation.getScreenWidthPix(context) *
          UIManipulation.getPlatformFac(0.6, 0.9),
      margin: const EdgeInsets.only(
        bottom: 20,
        top: 20,
      ),
      //width: UIManipulation.getScreenWidthPix(context) * UIManipulation.getPlatformFac(0.6, 0.9),
      // height: UIManipulation.getScreenHeightPix(context) * UIManipulation.getPlatformFac(0.8, 0.9),
      // color: currPal[1],
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        color: currPal[1],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Social Media",
            style: TextStyle(fontSize: platformFontSize(false), color: textColor),
            textAlign: TextAlign.center,
          ),
          buildGridView(),
        ],
      ),
    );
  }

  Widget buildGridView() => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return socialMediaLine(index);
        },
        itemCount: 5,
      );

  Widget socialMediaLine(int index) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.fill,
              child:InkWell(
                splashColor: currPal[3],
                onTap: () {
                  Uri url = Uri.parse(links[index]);
                  launchUrl(url);
                },
                child: Container(
                  //width: UIManipulation.getScreenWidthPix(context) *
                  //    UIManipulation.getPlatformFac(0.25, 0.35),
                  // height: UIManipulation.getScreenHeightPix(context) * UIManipulation.getPlatformFac(0.1, 0.1) ,
                  padding: const EdgeInsets.only(
                    top: 7,
                    bottom: 7,
                    left: 7,
                    right: 7,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: currPal[2],
                  ),
                  child:
                  SvgPicture.asset(
                    images[index],

                    fit: BoxFit.fill,
                  ),


                ),
              ),
            )
          ),
          Flexible(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                name[index],
                style:
                    TextStyle(fontSize: platformFontSize(true), color: textColor),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // getColors();

    return Scaffold(
      backgroundColor: currPal[0],
      body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: 0,
              top: UIManipulation.getScreenWidthPix(context) * 0.02,
              right: 0,
              bottom: 0),
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textTab(
                    "About me",
                    "I'm a young 18 year old bilingual Canadian university student attending the University of Waterloo in the Nanotechnology Engineering program, I am commonly known as Mr. DNA",
                    "assets/DNA.jpg",
                    false),
                textTab(
                    "About this App",
                    "This app is meant to be an experimental app, I wanted to create an app that I could complete semi easily and publish on the Google Play Store, it is built using the Flutter Framework",
                    "assets/flutter.jpg",
                    true),
                socialMediaTab(),
              ],
            ),
          )),
    );
  }

  double platformFontSize(bool small) {
    if (kIsWeb) {
      if (small) {
        return 50;
      } else {
        return 100;
      }
    } else {
      //Phones and Other Platforms
      if (small) {
        return 25;
      } else {
        return 50;
      }
    }
  }
}
