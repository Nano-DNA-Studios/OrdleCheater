import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ordlecheater/WordClass.dart';
import 'package:ordlecheater/functionStorage.dart';

import 'LetterBox.dart';
import 'WordleClass.dart';
import 'UIManipulation.dart';
import 'main.dart';

//GlobalKey<_LetterBox> subGlobalKey = GlobalKey();

class WordRow extends StatefulWidget {
  WordRow(
      {Key? key,
      required this.notifyParent,
      required this.wordNum,
      required this.wordClass})
      : super(key: key);

//  final functionStorage func;
  final int wordNum;
  final WordClass wordClass;

  // final WordleClass wordleClass;
  //final String word;
  final double widthFacPhone = 0.95;
  final double widthFacWeb = 0.6;
  final Function() notifyParent;

  @override
  State<WordRow> createState() => WordRowState();
}

class WordRowState extends State<WordRow> {
  //Make this more efficient theoretically

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getChildFunc() {
    print("inside child 1");

//LetterBox.globalKey.currentState?.updateLetter();
  }

  Widget Letters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LetterBox(
          notifyParent: widget.notifyParent,
          wordNum: widget.wordNum,
          letterNum: 1,
          wordClass: widget.wordClass,
        ),
        LetterBox(
          notifyParent: widget.notifyParent,
          wordNum: widget.wordNum,
          letterNum: 2,
          wordClass: widget.wordClass,
        ),
        LetterBox(
          notifyParent: widget.notifyParent,
          wordNum: widget.wordNum,
          letterNum: 3,
          wordClass: widget.wordClass,
        ),
        LetterBox(
          notifyParent: widget.notifyParent,
          wordNum: widget.wordNum,
          letterNum: 4,
          wordClass: widget.wordClass,
        ),
        LetterBox(
          notifyParent: widget.notifyParent,
          wordNum: widget.wordNum,
          letterNum: 5,
          wordClass: widget.wordClass,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: UIManipulation.calcFacorPix(
                UIManipulation.getScreenHeightPix(context),
                UIManipulation.getScreenWidthPix(context) *
                    UIManipulation.getPlatformFac(0.6, 0.95),
                5,
                true),
            width: UIManipulation.getWidthPix(
                UIManipulation.getScreenWidthPix(context),
                UIManipulation.getPlatformFac(0.6, 0.95)),
            child: Letters()));
  }
/*
  Widget wordRow(BuildContext cont, String word, WordClass wordClass, int wordIndex) {
    return Center(
      child: SizedBox(
          height: UIManipulation.calcFacorPix(
              UIManipulation.getScreenHeightPix(cont),
              UIManipulation.getScreenWidthPix(cont) *
                  UIManipulation.getPlatformFac(0.6, 0.95), 5, true),
          width: UIManipulation.getWidthPix(
              UIManipulation.getScreenWidthPix(cont),
              UIManipulation.getPlatformFac(0.6, 0.95)),
          child: WordRow(word: "Hello")//letterBoxes( word, wordClass, wordIndex ),


      ),
    );
  }

 */

}

/*
class WordRow extends StatefulWidget {
  WordRow({Key? key, required this.word}) : super(key: key);

//  final WordleClass wordleClass;
  final String word;
  final double widthFacPhone = 0.95;
  final double widthFacWeb = 0.6;

  @override
  State<WordRow> createState() => _WordRow();
}

class _WordRow extends State<WordRow> {
  //Make this more efficient theoretically
  double _GetWidthFac() {
    if (kIsWeb) {
      return widget.widthFacWeb;
    } else {
      //Phones and Other Platforms
      return widget.widthFacPhone;
    }
  }

  double _GetWidthPix() {
    return MediaQuery.of(context).size.width * _GetWidthFac();
  }

  double _GetHeightPix() {
    return MediaQuery.of(context).size.height * _CalcHeightFac();
  }

  double _CalcHeightFac() {
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth =
    ((MediaQuery.of(context).size.width * _GetWidthFac()) / 5);
    return (cardWidth) / screenHeight;
  }

  Widget Letters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LetterBox(letter: widget.word.characters.elementAt(0).toString()),
        LetterBox(letter: widget.word.characters.elementAt(1).toString()),
        LetterBox(letter: widget.word.characters.elementAt(2).toString()),
        LetterBox(letter: widget.word.characters.elementAt(3).toString()),
        LetterBox(letter: widget.word.characters.elementAt(4).toString()),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: _GetHeightPix(), width: _GetWidthPix(), child: Letters()));
  }
}

 */
