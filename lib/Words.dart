import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ordlecheater/WordClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UIManipulation.dart';
import 'allColorPalettes.dart';

class Words extends StatefulWidget {
  const Words({
    Key? key,
    required this.wordClass,
    required this.notifyParent,
  }) : super(key: key);
  final WordClass wordClass;
  final Function() notifyParent;

  @override
  State<Words> createState() => _Words();
}

class _Words extends State<Words> {
  // late List<Color> ColorPal = widget.wordClass.palette;
  // late Color textColor = widget.wordClass.textColor;

  late List<Color> ColorPal = widget.wordClass.palette;
  late Color textColor = widget.wordClass.textColor;

  @override
  Widget build(BuildContext context) {
    ColorPal = widget.wordClass.palette;
    textColor = widget.wordClass.textColor;
    widget.wordClass.updatePossibleWords();
    return words(this.context, widget.wordClass);
  }

  @override
  void didUpdateWidget(Words oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print("update");
    ColorPal = widget.wordClass.palette;
    textColor = widget.wordClass.textColor;
    //print("hello");
  }

  Widget words(BuildContext context, WordClass wordClass) {
    //wordClass.updatePossibleWords();
    //print("Updated list");

return  Container(
  padding: EdgeInsets.only(
      left: 0,
      top: UIManipulation.getScreenHeightPix(context) *
          UIManipulation.getPlatformFac(0.1, 0.01),
      right: 0,
      bottom: 0),
  child: FractionallySizedBox(
    widthFactor: UIManipulation.getPlatformFac(0.7, 0.95),
    child: Container(
      alignment: Alignment.center,
      padding:
      EdgeInsets.all(UIManipulation.getScreenWidthPix(context) * 0.05),
      decoration:  BoxDecoration(
          color: ColorPal[1],
          borderRadius: const BorderRadius.all(Radius.circular(40))),
      child: buildGridView(),
    ),
  ),
);


  }

  Widget buildGridView() => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: platfromGridNum(),
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return BuildGridWidget(index);
        },
        itemCount: maxNum(widget.wordClass.possibleWords.length),
      );

  Widget BuildGridWidget(int index) {
    return GestureDetector(
      child: Container(
          alignment: Alignment.center,
          child: Container(
              height: platformFontSize() + 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: ColorPal[2],
              ),
              child: FittedBox(
                child: Text(
                  widget.wordClass.possibleWords[index],
                  maxLines: 1,
                  style: TextStyle(fontSize: 500, color: textColor),
                ),
                fit: BoxFit.fitHeight,
              ))),
      onTap: () {
        //setState(() {
        //wordInput = textController.text.toString();
        widget.wordClass.addWord(widget.wordClass.possibleWords[index]);

        widget.notifyParent();

        //
        //  });
      },
    );
  }

  int platfromGridNum() {
    if (kIsWeb) {
      return 4;
    } else {
      //Phones and Other Platforms
      return 2;
    }
  }

  double platformFontSize() {
    if (kIsWeb) {
      return 75;
    } else {
      //Phones and Other Platforms
      return 40;
    }
  }

  int maxNum(int length) {
    if (length > 100) {
      return 100;
    } else {
      return length;
    }
  }

/*
  Container(
        padding: EdgeInsets.only(
            left: 0,
            top: UIManipulation.getScreenHeightPix(context) *
                UIManipulation.getPlatformFac(0.1, 0.01),
            right: 0,
            bottom: 0),
        child: FractionallySizedBox(
          widthFactor: UIManipulation.getPlatformFac(0.7, 0.95),
          child: Container(
            alignment: Alignment.center,
            padding:
            EdgeInsets.all(UIManipulation.getScreenWidthPix(context) * 0.05),
            decoration:  BoxDecoration(
                color: ColorPal[1],
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            child: buildGridView(),
          ),
        ),
      ),

   */

}
