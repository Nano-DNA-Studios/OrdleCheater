import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:ordlecheater/main.dart';

import 'allWords.dart';

class WordClass {
  static const String space = " ";

  late bool upperCase;

  late String letter1 = "";
  late String letter2 = "";
  late String letter3 = "";
  late String letter4 = "";
  late String letter5 = "";

  late List<String> includedLetters = [];
  late List<String> removeLetters = [];

  late String word1 = "Crane";
  late String word2 = "Biome";
  late String word3 = "";
  late String word4 = "";
  late String word5 = "";

  late List<String> possibleWords = [];

/*
  WordleClass() {
    //loadWords();
   // possibleWords = calcPossibleWords();


  }

 */

  WordClass () {
    print("start");
    upperCase = true;
    cleanWords();

  }



  //Need to add a function that capatilizes everything or lowercases everything



  void updatePossibleWords() {
    possibleWords = calcPossibleWords();
  }

  List<String> calcPossibleWords() {
    // List<String> listCopy = allWords;
    List<String> wordList = allWords3;
    // List<String> wordList2 = allWords;

    print(removeLetters);

    wordList = cleanList(wordList);
    wordList = removeUnwantedWords(wordList, removeLetters);

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
    removeLetters.clear();

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

  String getLetter(int wordNum, int letterNum) {
    //Maybe turn the words stuff to a list (think later)

    switch (wordNum) {
      case 1:
        if (word1.isEmpty || word1 == "") {
          return space;
        } else {
          if ((letterNum - 1) > word1.length) {
            return space;
          } else {
            return word1.characters.characterAt(letterNum - 1).toString();
          }
        }

      case 2:
        if (word2.isEmpty || word2 == "") {
          return space;
        } else {
          if ((letterNum - 1) > word2.length) {
            return space;
          } else {
            return word2.characters.characterAt(letterNum - 1).toString();
          }
        }

      case 3:
        if (word3.isEmpty || word3 == "") {
          return space;
        } else {
          if ((letterNum - 1) > word3.length) {
            return space;
          } else {
            return word3.characters.characterAt(letterNum - 1).toString();
          }
        }

      case 4:
        if (word4.isEmpty || word4 == "") {
          return space;
        } else {
          if ((letterNum - 1) > word4.length) {
            return space;
          } else {
            return word4.characters.characterAt(letterNum - 1).toString();
          }
        }

      case 5:
        if (word5.isEmpty || word5 == "") {
          return space;
        } else {
          if ((letterNum - 1) > word5.length) {
            return space;
          } else {
            return word5.characters.characterAt(letterNum - 1).toString();
          }
        }

      default:
        return space;
    }
  }

  void addLetterAtPos (int pos, String letter) {
    switch (pos) {
      case 1:
        letter1 = letter;
        break;
      case 2:
        letter2 = letter;
        break;
      case 3:
        letter3 = letter;
        break;
      case 4:
        letter4 = letter;
        break;
      case 5:
        letter5 = letter;
        break;
    }
  }

  void removeLetterAtPos (int pos) {
    switch (pos) {
      case 1:
        letter1 = "";
        break;
      case 2:
        letter2 = "";
        break;
      case 3:
        letter3 = "";
        break;
      case 4:
        letter4 = "";
        break;
      case 5:
        letter5 = "";
        break;
    }
  }


  bool isLetterCorrect (int pos, String letter) {

    switch (pos) {
      case 1:
        return areEqual(letter1, letter);

      case 2:
        return areEqual(letter2, letter);

      case 3:
        return areEqual(letter3, letter);

      case 4:
        return areEqual(letter4, letter);

      case 5:
        return areEqual(letter5, letter);
      default:
        return false;
    }
  }

  bool areEqual (String letterAtPos, String letterInp) {
    if (letterAtPos.toLowerCase() == letterInp.toLowerCase()) {
      return true;
    } else {
      return false;
    }
  }

  void cleanWords () {
    //Clean the words by making them lower case
    /*
    word1 = word1.toLowerCase();
    word2 = word2.toLowerCase();
    word3 = word3.toLowerCase();
    word4 = word4.toLowerCase();
    word5 = word5.toLowerCase();

     */

    word1 = word1.toUpperCase();
    word2 = word2.toUpperCase();
    word3 = word3.toUpperCase();
    word4 = word4.toUpperCase();
    word5 = word5.toUpperCase();
  }


  List<String> cleanList (List<String> wordList) {
    List<String> newWords = [];
    for (String i in wordList) {
      if (upperCase) {
        newWords.add(i.toUpperCase());
      } else {
        newWords.add(i.toLowerCase());
      }


    }

    return newWords;

  }

  List<String> removeUnwantedWords (List<String> words, List<String> letters) {
    if (letters.isEmpty) {
      print("in here");
      return words;
    }

    List<String> newList = [];
    for (String word in words) {
      bool included = false;
      for (String letter in letters) {
        if (word.contains(letter)) {
          included = true;
        }
      }
      if (!included) {
        newList.add(word);
      }
    }
    return newList;
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
