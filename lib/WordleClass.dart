//import 'dart:ffi';
import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey, rootBundle;
import 'package:flutter/widgets.dart';
import 'package:ordlecheater/LetterBox.dart';
import 'package:ordlecheater/WordClass.dart';
import 'package:ordlecheater/WordRow.dart';
import 'package:ordlecheater/Words.dart';
import 'package:ordlecheater/allLetters.dart';
import 'package:ordlecheater/wordChoices.dart';
import 'package:ordlecheater/functionStorage.dart';
import 'package:ordlecheater/main.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void notifyParent() {
    setState(() {
      word1 = "Unity";
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (event) {
          if (validKeys.contains(event.logicalKey) &&
              event.character.toString() != "null") {
            print("letter detected");
            wordClass.word4 += event.character.toString();
            print(wordClass.word4);
            setState(() {
              print("Setting state");

             // WordRowState.getChildFunc();

            });
          } else {
            print("not entered");
          }
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purpleAccent,
              title: const Text("Wordle"),
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 0,
                    top: UIManipulation.getScreenWidthPix(context) * 0.05,
                    right: 0,
                    bottom: 0),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
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

              //Spawn the possible words section
              Words(wordClass: wordClass),

              //  Words(
                  //  dataClass: wordleClass,
                   // ),

                    // wordRow(context, "Hello", wordClass, 1),
                    // wordRow(context, "Class", wordClass, 2),
                    //  wordRow(context, "Words", wordClass, 3),
                    //  wordRow(context, "Bunny", wordClass, 4),
                    //  wordRow(context, "Whale", wordClass, 5),

                    //words(context)
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
