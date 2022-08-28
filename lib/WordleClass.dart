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
/*
class WordleClass {

  WordClass wordClass = WordClass();

  late String word1;
  late String word2;
  late String word3;
  late String word4;
  late String word5;

  //Function to generate the 5 word boxes
  //Function to generate the possible words to display

  WordleClass() {
    //Initialize the screen


  }
  Widget wordInputs() {
    return Column(
      children: [
        //Word rows


      ],
    );
  }

  Row genTitle() {
    Row title = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        const Expanded(
            flex: 3,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text("Possible Words"),
            )),
        Expanded(
          flex: 1,
          child: Container(),
        )
      ],
    );

    return title;
  }
}

 */

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

  //remove all the async getColors except for this one, feed the color into the word class and fetch from there wherever needed

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
      // textColor = UIManipulation.ColorChoice(Colors.white, Colors.black, choice);
      // wordClass.textColor = UIManipulation.ColorChoice(Colors.white, Colors.black, choice);
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
      child: Card(
        color: Colors.red,
        child: Container(
          height: 100,
          color: Colors.deepPurple,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text("Hello"),
          ),
        ),
      ),
      flex: flex,
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
              child: Container(
                  height: UIManipulation.getPlatformFac(
                      UIManipulation.getScreenHeightPix(context) * 0.4 * 0.5,
                      UIManipulation.getScreenHeightPix(context) * 0.4 * 0.2),
                  child: Card(
                      color: Colors.red,
                      child: InkWell(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text("DEL"),
                        ),
                        onTap: () {
                          //Tomorrow or whenever the next time is I need to add the RemoveWord function to the delete button and then I'm basically done

                          setState(() {
                            wordClass.removeWord();
                            print(wordClass.wordNum);

                            /*
                          wordInput = textController.text.toString();

                          if (WordClass.wordInList(wordClass.clean1Word(wordInput), wordClass.upperCase)) {
                            print("InputField: " + wordInput);
                            //Add the word to the list I guess
                            wordClass.addWord(wordClass.clean1Word(wordInput));
                            wordInput = "";
                            textController.text = "";


                          }
                           */
                          });
                          //Check if word is contained in the all word list and then add it
                        },
                        splashColor: Colors.blue,
                      ))),
            ),
            //Text Field
            Flexible(
              flex: 3,
              child: Container(
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
              child: Container(
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
                        child: FittedBox(
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
        /*
        onKey: (event) {
          if (validKeys.contains(event.logicalKey)) {
            //  print(event.character.toString());
            //&&
            //               event.character.toString() != "null"

            //  print("letter detected");

            if (event.logicalKey == LogicalKeyboardKey.backspace) {
              if (currentWord.length > 0) {
                print("Before: $currentWord");

                String placeHolder = currentWord;
                currentWord = "";
                for (int i = 0; i < placeHolder.length - 1; i++) {
                  currentWord = currentWord + placeHolder[i];
                }

                print("After: $currentWord");
              }
            } else {
              if (event.character.toString() != "null") {
                currentWord += event.character.toString();
              }
            }

            // print(currentWord);

            setState(() {
              print("Setting state");
              wordClass.displayLetters(currentWord);
            });
          } else {
            print("not entered");
            print(event.character.toString());
          }
        },

         */
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

/*

class WordlePage extends StatefulWidget {
  const WordlePage({Key? key}) : super(key: key);

  //final WordClass wordClass;

  @override
  State<WordlePage> createState() => _WordlePage();
}


class _WordlePage extends State<WordlePage> {

  WordClass wordClass = WordClass();

  void notifyParent () {

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
      return 80;
    } else {
      //Phones and Other Platforms
      return 45;
    }
  }

  int maxNum(int length) {
    if (length > 200) {
      return 200;
    } else {
      return length;
    }
  }

//Maybe not needed
  Row wordRowWidget(List<String> words) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(words[0]),
        Text(words[1]),
        Text(words[2]),
        Text(words[3]),


      ],
    );
  }


  Widget buildGridView() =>
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: platfromGridNum(),
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return BuildGridWidget(index);
        },
        itemCount: maxNum(wordClass.possibleWords.length),
      );


  Widget BuildGridWidget(int index) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          height: platformFontSize() + 10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(const Radius.circular(20)),
            color: Colors.lightBlueAccent,
          ),
          child: Text(
            wordClass.possibleWords[index],
            maxLines: 1,
            style: TextStyle(fontSize: platformFontSize()),
          ),
        )

    );
  }

  Widget letterBoxes(String word, WordClass wordClass, int wordIndex) {

    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        LetterBox(letter: "h")


       //LetterBox(letter: word.characters.elementAt(0).toString(), wordIndex: wordIndex, letterIndex: 1, wordClass: wordClass, notifyParent: notifyParent),
        //LetterBox(letter: word.characters.elementAt(1).toString(), wordIndex: wordIndex, letterIndex: 2, wordClass: wordClass, notifyParent: notifyParent),
       // LetterBox(letter: word.characters.elementAt(2).toString(), wordIndex: wordIndex, letterIndex: 3, wordClass: wordClass, notifyParent: notifyParent),
       // LetterBox(letter: word.characters.elementAt(3).toString(), wordIndex: wordIndex, letterIndex: 4, wordClass: wordClass, notifyParent: notifyParent),
       // LetterBox(letter: word.characters.elementAt(4).toString(), wordIndex: wordIndex, letterIndex: 5, wordClass: wordClass, notifyParent: notifyParent)
      ],
    );
  }

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

  Widget words (BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, top: UIManipulation.getScreenHeightPix(context) * 0.1, right: 0, bottom: 0),
      child: FractionallySizedBox(
        widthFactor: UIManipulation.getPlatformFac(0.7, 0.95),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(UIManipulation.getScreenWidthPix(context) * 0.05),
          decoration: const BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Expanded(child: buildGridView()),
        ),
      ),
    )
    ;
  }


//Pass the WordClass Words as the word
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text("Wordle"),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 0,
                top: UIManipulation.getScreenWidthPix(context) * 0.05,
                right: 0,
                bottom: 0),
            scrollDirection: Axis.vertical,
            child: Column(

              children: [
                WordRow(word: "Hello"),
             // wordRow(context, "Hello", wordClass, 1),
               // wordRow(context, "Class", wordClass, 2),
              //  wordRow(context, "Words", wordClass, 3),
              //  wordRow(context, "Bunny", wordClass, 4),
              //  wordRow(context, "Whale", wordClass, 5),

                words(context)


              ],
            )));
  }


}

 */

/*
Possibly wanted






 */
