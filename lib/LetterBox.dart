import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ordlecheater/UIManipulation.dart';
import 'package:ordlecheater/main.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'WordClass.dart';
import 'allColorPalettes.dart';

class LetterBox extends StatefulWidget {
  const LetterBox(
      {required this.notifyParent,
      required this.wordNum,
      required this.letterNum,
      required this.wordClass});

  //Letterbox needs to store
  /*
  letter
  the function to update
  word number //Which word it is
  letter number
wordclass
   */

  final int wordNum;
  final int letterNum;
  final WordClass wordClass;

  //final String letter;
  final Function() notifyParent;

  @override
  State<LetterBox> createState() => LetterBoxState();
}

class LetterBoxState extends State<LetterBox> {

  int colorState = 1;
  FocusNode focusNode = FocusNode();
  String letter = "";

  late List<Color> ColorPal = widget.wordClass.palette;
  late Color textColor = widget.wordClass.textColor;
  late Color cardColor = widget.wordClass.palette[3];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("init");
    letter = widget.wordClass.getLetter(widget.wordNum, widget.letterNum);
    updateLetter();


    // print("letter is " + letter);
  }

  @override
  void didUpdateWidget(LetterBox oldWidget) {
    super.didUpdateWidget(oldWidget);
   // print("update");
    updateLetter();

    //print("hello");
  }

  void updateLetter() {
    letter = widget.wordClass.getLetter(widget.wordNum, widget.letterNum);
    ColorPal = widget.wordClass.palette;
    textColor = widget.wordClass.textColor;

    //check if the letter is contained in possible list or confirmed list
    if (widget.wordClass.includedLetters.contains(letter)) {
      //set to orange at least, check if in correct position as well to make it green
      if (colorState <= 2) {
        colorState = 2;
        cardColor = Colors.orange;
      }

      if (widget.wordClass.isLetterCorrect(widget.letterNum, letter)) {
        colorState = 3;
        cardColor = Colors.green;
      }
    } else {
      colorState = 1;
      cardColor = ColorPal[3];

      if (!widget.wordClass.removeLetters.contains(letter)) {
        widget.wordClass.removeLetters.add(letter);
      }
    }

  }

  void getFocus() {
    focusNode.requestFocus();

    setState(() {
      cardColor = Colors.deepPurple;

      //widget.notifyParent();

      //Open keyboard for mobile users
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorPal = widget.wordClass.palette;
    textColor = widget.wordClass.textColor;
    //cardColor = widget.wordClass.palette[3];
   // getColors();
    return Expanded(
      child: Card(

          color: cardColor,
          child: HoldDetector(
            holdTimeout: const Duration(milliseconds: 100),
            onHold: getFocus,
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.notifyParent();

                  updateLetter();

                  colorState++;
                  if (colorState > 3) {
                    colorState = 1;
                  }

                  switch (colorState) {
                    case 1:
                      //Maybe change back to white or black
                      cardColor = ColorPal[3];
                      widget.wordClass.removeLetterAtPos(widget.letterNum);
                      widget.wordClass.includedLetters.remove(letter);
                      widget.wordClass.removeLetters.add(letter);

                      break;
                    case 2:
                      cardColor = Colors.orange;
                      widget.wordClass.includedLetters.add(letter);
                      widget.wordClass.removeLetters.remove(letter);
                      widget.wordClass.addUsedLetter(widget.letterNum, letter);


                      print(widget.wordClass.removeLetters);

                      break;
                    case 3:
                      cardColor = Colors.green;
                      widget.wordClass.addLetterAtPos(widget.letterNum, letter);
                      widget.wordClass.removeUsedLetter(widget.letterNum, letter);

                      //Gonna have to add to an existing or create a new function that removes letters from usedLetters x arrays

                      break;
                  }
                });
              },
              splashColor: Colors.blue,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(letter, style: TextStyle(color: textColor),
                    // focusNode: focusNode,
                    // onChanged: (value) {
                    // returnWord(value);
                    // },
                    ),
              ),
            ),
          )),
    );
  }
}

/*
class LetterBox extends StatefulWidget {
  const LetterBox(
      {required this.letter,});
     // required this.wordIndex,
     // required this.letterIndex,
     // required this.wordClass,
    //  required this.notifyParent});

  final String letter;
 // final int wordIndex;
//  final int letterIndex;
//  final WordClass wordClass;
  //final Function() notifyParent;

  @override
  State<LetterBox> createState() => _LetterBox();
}

class _LetterBox extends State<LetterBox> {
  Color cardColor = Colors.white;
  int colorState = 1;
  String currentWord = "";
  FocusNode focusNode = FocusNode();
/*
  String word() {
    switch (widget.wordIndex) {
      case 1:
        return widget.wordClass.word1;

      case 2:
        return widget.wordClass.word2;

      case 3:
        return widget.wordClass.word3;

      case 4:
        return widget.wordClass.word4;

      case 5:
        return widget.wordClass.word5;

      default:
        return widget.wordClass.word1;
    }
  }

 */

  void getFocus() {
    focusNode.requestFocus();
  }

  void editWord() {}

  void returnWord(String val) {
    currentWord = val;
/*
    switch (widget.wordIndex) {
      case 1:
        widget.wordClass.word1 = currentWord;
        break;

      case 2:
        widget.wordClass.word1 = currentWord;
        break;

      case 3:
        widget.wordClass.word1 = currentWord;
        break;

      case 4:
        widget.wordClass.word1 = currentWord;
        break;

      case 5:
        widget.wordClass.word1 = currentWord;
        break;

      default:


    }

 */
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Card(
          color: cardColor,
         // child: HoldDetector(
            //holdTimeout: const Duration(milliseconds: 300),
            //onHold: getFocus,
            child: InkWell(
              onTap: () {
                setState(() {
                  colorState++;
                  if (colorState > 3) {
                    colorState = 1;
                  }
                  switch (colorState) {
                    case 1:
                      cardColor = Colors.white;
                      break;
                    case 2:
                      cardColor = Colors.orange;
                      break;
                    case 3:
                      cardColor = Colors.green;
                      break;
                  }
                });
              },
              splashColor: Colors.blue,
              child: FittedBox(
                fit: BoxFit.contain,
                child: TextField(
                  focusNode: focusNode,
                  onChanged: (value) {
                    returnWord(value);
                  },
                ),
              ),
            ),
      //    )
      ),
    );

    return Expanded(
      child: Card(
          color: cardColor,
          child: InkWell(
            onTap: () {
              setState(() {
                colorState++;
                if (colorState > 3) {
                  colorState = 1;
                }
                switch (colorState) {
                  case 1:
                    cardColor = Colors.white;
                    break;
                  case 2:
                    cardColor = Colors.orange;
                    break;
                  case 3:
                    cardColor = Colors.green;
                    break;
                }
              });
            },
            splashColor: Colors.blue,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(widget.letter),
            ),
          )),
    );






  }
}

 */
