
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:ordlecheater/main.dart';

import 'allWords.dart';
class WordClass {

  late String letter1 = "";
  late String letter2 = "";
  late String letter3 = "";
  late String letter4 = "";
  late String letter5 = "";

  late List<String> includedLetters = [];

  late String word1;
  late String word2;
  late String word3;
  late String word4;
  late String word5;


  late List<String> possibleWords = [];

  /*
  WordleClass() {
    //loadWords();
   // possibleWords = calcPossibleWords();
  }

   */

  void updatePossibleWords () {
    possibleWords = calcPossibleWords();
  }


  List<String> calcPossibleWords() {
    // List<String> listCopy = allWords;
    List<String> wordList = allWords;
    // List<String> wordList2 = allWords;

    //Have checks for each of these
    if (letter1.isNotEmpty) {
      wordList = wordsAtPos(letter1, 0, wordList);
    }
    if (letter2.isNotEmpty) {
      wordList = wordsAtPos(letter2, 1, wordList);
    }
    if (letter3.isNotEmpty) {
      wordList = wordsAtPos(letter3, 2, wordList);
    }
    if (letter4.isNotEmpty) {
      wordList = wordsAtPos(letter4, 3, wordList);
    }
    if (letter5.isNotEmpty) {
      wordList = wordsAtPos(letter5, 4, wordList);
    }

    if (includedLetters.isNotEmpty) {
      wordList = wordsWithIncluded(wordList, includedLetters);
    }

    return wordList;
  }

  List<String> wordsWithIncluded(List<String> words, List<String> letters) {
    List<String> newWords = [];
    //Word must contain all the letters that are included

    for (String word in words) {
      bool wordCheck = true;
      for (String letter in letters) {
        if (word.contains(letter)) {
        } else {
          wordCheck = false;
        }
      }
      if (wordCheck) {
        newWords.add(word);
      }
    }

    return newWords;
  }

  List<String> wordsAtPos(String letter, int pos, List<String> words) {
    List<String> newWords = [];
    if (letter == "" || letter == " " || letter == null) {
      return words;
    } else {
      for (String i in words) {
        if (i.characters.characterAt(pos).toString() == letter) {
          newWords.add(i);
        }
      }
      return newWords;
    }
  }





}

/*
garbage for now
 */


/*
  void loadWords() async {
    String path = "assets/Words";
    String textW = await rootBundle.loadString(path);

    String word = "";

    //Clean up the string

    for (int i = 0; i < textW.characters.length; i++) {
      word = word + textW[i];
      if (word.characters.length >= 5) {
        allWords.add(word);
        word = "";
      }
    }

    possibleWords = calcPossibleWords();
  }

 */

/*
  Column genWordListDisplay() {
    List<Widget> wordRows = [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        genTitle(),
        Text(possibleWords.length.toString()),
        buildGridView()
      ],
    );
  }

 */


/*
  Widget wordsView() {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      children: [
        Text(possibleWords[0]),
        Text(possibleWords[1]),
        Text(possibleWords[2]),
        Text(possibleWords[3]),
        Text(possibleWords[4]),
        Text(possibleWords[5]),
        Text(possibleWords[6]),
        Text(possibleWords[7]),
        Text(possibleWords[8]),
        Text(possibleWords[9]),
      ],
    );
  }

 */

/*
      child: FittedBox (
        fit: BoxFit.contain,
        child: Text(possibleWords[index], maxLines: 1,),
      )
      */

// Text(possibleWords[index], maxLines: 1,style: TextStyle(fontSize: 50),),


/*
    return  Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[100 * index],
      child: const Text("He'd have you all unravel at the"),
    );

     */

/*
      Expanded(
        flex: 2,
        child: Center(
          child: Text(words[0]),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
        flex: 2,
        child: Center(
          child: Text(words[1]),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
        flex: 2,
        child: Center(
          child: Text(words[2]),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
        flex: 2,
        child: Center(
          child: Text(words[3]),
        ),
      ),


      Expanded(
          flex: 2,
         child: FittedBox(
            fit: BoxFit.contain,
            child: Text(words[0]),
          )),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(words[1]),
          )),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(words[2]),
          )),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(words[3]),
          )),

       */


