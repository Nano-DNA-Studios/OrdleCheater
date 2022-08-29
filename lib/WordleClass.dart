//import 'dart:ffi';
//import 'dart:js';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey, rootBundle;
import 'package:flutter/widgets.dart';
import 'package:ordlecheater/LetterBox.dart';
import 'package:ordlecheater/WordClass.dart';
import 'package:ordlecheater/WordRow.dart';
import 'package:ordlecheater/Words.dart';
import 'package:ordlecheater/allColorPalettes.dart';
import 'package:ordlecheater/allLetters.dart';
import 'package:ordlecheater/wordChoices.dart';
import 'package:ordlecheater/functionStorage.dart';
import 'package:ordlecheater/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UIManipulation.dart';
import 'allLetters.dart';
import 'WordRow.dart';

class WordlePage extends StatefulWidget {
  const WordlePage({Key? key}) : super(key: key);

  @override
  State<WordlePage> createState() => _WordlePage();
}

class _WordlePage extends State<WordlePage> {
  //Create a new Word Class
  late void Function() myMethod;

  late Function() childFunc;

  WordClass wordClass = WordClass();
  functionStorage store = new functionStorage();
  WordChoices choices = WordChoices();

  String word1 = "Hello";
  String word2 = "Wrong";
  String word3 = "Color";
  String word4 = "Blues";

  String wordInput = "";

  final textController = TextEditingController();

  late List<Color> ColorPal = Palettes[0];
  late Color textColor = Colors.white;
  late int choice = 0;

  void getColors() async {
    final prefs = await SharedPreferences.getInstance();
    choice = prefs.getInt('ColorMode') ?? 0;

    setState(() {
      ColorPal = Palettes[choice];
      wordClass.palette = ColorPal;
      wordClass.textColor =
          UIManipulation.ColorChoice(Colors.white, Colors.black, choice);
      textColor =
          UIManipulation.ColorChoice(Colors.white, Colors.black, choice);

    });
  }

  void notifyParent() {
    setState(() {
      word1 = "Unity";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getColors();
  }

  Widget cardWid(int flex) {
    return Flexible(
      flex: flex,
      child: Card(
        color: Colors.red,
        child: Container(
          height: 100,
          color: Colors.deepPurple,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Text("Hello"),
          ),
        ),
      ),
    );
  }

  Widget controller() {
    return Container(
      height: UIManipulation.getScreenHeightPix(context) *
          UIManipulation.getPlatformFac(0.4, 0.2),
      width: UIManipulation.getScreenWidthPix(context) *
          UIManipulation.getPlatformFac(0.7, 0.95),
      child: SizedBox(
        width: UIManipulation.getScreenWidthPix(context) *
            UIManipulation.getPlatformFac(0.7, 0.95) *
            0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              //Delete
              child: SizedBox(
                  height: UIManipulation.getPlatformFac(
                      UIManipulation.getScreenHeightPix(context) * 0.4 * 0.5,
                      UIManipulation.getScreenHeightPix(context) * 0.4 * 0.2),
                  child: Card(
                      color: Colors.red,
                      child: InkWell(
                        onTap: () {

                          setState(() {
                            wordClass.removeWord();
                            print(wordClass.wordNum);

                          });
                          //Check if word is contained in the all word list and then add it
                        },
                        splashColor: Colors.blue,
                        child: const FittedBox(
                          fit: BoxFit.contain,
                          child: Text("DEL"),
                        ),
                      ))),
            ),
            //Text Field
            Flexible(
              flex: 3,
              child: SizedBox(
                  height: UIManipulation.getPlatformFac(
                      UIManipulation.getScreenHeightPix(context) * 0.4 * 0.5,
                      UIManipulation.getScreenHeightPix(context) * 0.4 * 0.2),
                  child: Card(
                    color: ColorPal[3],
                    child: TextField(
                      controller: textController,
                      style: TextStyle(
                          fontSize: UIManipulation.getPlatformFac(
                              UIManipulation.getScreenHeightPix(context) *
                                  0.4 *
                                  0.5 *
                                  0.75,
                              UIManipulation.getScreenHeightPix(context) *
                                  0.4 *
                                  0.2 *
                                  0.75),
                          color: textColor),
                      keyboardType: TextInputType.text,
                    ),
                  )),
            ),
            //Add
            Flexible(
              flex: 1,
              child: SizedBox(
                  height: UIManipulation.getPlatformFac(
                      UIManipulation.getScreenHeightPix(context) * 0.4 * 0.5,
                      UIManipulation.getScreenHeightPix(context) * 0.4 * 0.2),
                  child: Card(
                      color: Colors.green,
                      child: InkWell(
                        onTap: () {
                          //Tomorrow or whenever the next time is I need to add the RemoveWord function to the delete button and then I'm basically done

                          setState(() {
                            wordInput = textController.text.toString();

                            if (WordClass.wordInList(
                                wordClass.clean1Word(wordInput),
                                wordClass.upperCase)) {
                              //print("InputField: " + wordInput);
                              //Add the word to the list I guess
                              wordClass.addWord(wordClass.clean1Word(wordInput));
                              wordInput = "";
                              textController.text = "";
                              print(wordClass.wordNum);
                            }
                          });
                          //Check if word is contained in the all word list and then add it
                        },
                        splashColor: Colors.blue,
                        child: const FittedBox(
                          fit: BoxFit.contain,
                          child: Text("ADD"),
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // getColors();

    return RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,

        child: Scaffold(
            backgroundColor: ColorPal[0],
            appBar: null,
            body: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 0,
                    top: UIManipulation.getScreenWidthPix(context) * 0.02,
                    right: 0,
                    bottom: 0),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wordle",
                      style: TextStyle(
                          fontSize: UIManipulation.getScreenHeightPix(context) *
                              UIManipulation.getPlatformFac(0.2, 0.1),
                          color: textColor),
                    ),

                    WordRow(
                      notifyParent: notifyParent,
                      wordNum: 1,
                      wordClass: wordClass,
                    ),
                    WordRow(
                      notifyParent: notifyParent,
                      wordNum: 2,
                      wordClass: wordClass,
                    ),
                    WordRow(
                      notifyParent: notifyParent,
                      wordNum: 3,
                      wordClass: wordClass,
                    ),
                    WordRow(
                      notifyParent: notifyParent,
                      wordNum: 4,
                      wordClass: wordClass,
                    ),
                    WordRow(
                      notifyParent: notifyParent,
                      wordNum: 5,
                      wordClass: wordClass,
                    ),

                    controller(),

                    //Spawn the possible words section
                    Words(wordClass: wordClass),
                  ],
                ))));
  }
}

