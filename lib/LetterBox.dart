import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ordlecheater/main.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'WordClass.dart';

class LetterBox extends StatefulWidget {
  const LetterBox(
      {required this.letter,
      required this.wordIndex,
      required this.letterIndex,
      required this.wordClass,
      required this.notifyParent});

  final String letter;
  final int wordIndex;
  final int letterIndex;
  final WordClass wordClass;
  final Function() notifyParent;

  @override
  State<LetterBox> createState() => _LetterBox();
}

class _LetterBox extends State<LetterBox> {
  Color cardColor = Colors.white;
  int colorState = 1;
  String currentWord = "";
  FocusNode focusNode = FocusNode();

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

  void getFocus() {
    focusNode.requestFocus();
  }

  void editWord() {}

  void returnWord(String val) {
    currentWord = val;

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
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          color: cardColor,
          child: HoldDetector(
            holdTimeout: const Duration(milliseconds: 300),
            onHold: getFocus,
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
          )),
    );
  }
}
