import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:ordlecheater/main.dart';

import 'allColorPalettes.dart';
import 'allWords.dart';

class WordClass {
  static const String space = " ";

  late bool upperCase;

  late List<Color> palette = Palettes[0];
  late Color textColor = Colors.white;

  late String letter1 = "";
  late String letter2 = "";
  late String letter3 = "";
  late String letter4 = "";
  late String letter5 = "";

  late List<String> lettersUsed1 = [];
  late List<String> lettersUsed2 = [];
  late List<String> lettersUsed3 = [];
  late List<String> lettersUsed4 = [];
  late List<String> lettersUsed5 = [];

  late List<String> includedLetters = [];
  late List<String> removeLetters = [];

  late String word1 = "";
  late String word2 = "";
  late String word3 = "";
  late String word4 = "";
  late String word5 = "";

  late int wordNum = 1;

  late List<String> possibleWords = [];

/*
  WordleClass() {
    //loadWords();
   // possibleWords = calcPossibleWords();
  }
 */
  WordClass() {

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

    // print(removeLetters);

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

    wordList = wordsWithoutUsed(wordList, lettersUsed1, 0);
    wordList = wordsWithoutUsed(wordList, lettersUsed2, 1);
    wordList = wordsWithoutUsed(wordList, lettersUsed3, 2);
    wordList = wordsWithoutUsed(wordList, lettersUsed4, 3);
    wordList = wordsWithoutUsed(wordList, lettersUsed5, 4);

    if (includedLetters.isNotEmpty) {
      wordList = wordsWithIncluded(wordList, includedLetters);
    }

    //Rank words in best order
    if (word1.isNotEmpty) {
      wordList = rankWords(wordList);
    }

    return wordList;
  }

  //Make a function that deletes everything and then reloads all saved info

  List<String> wordsWithoutUsed(
      List<String> words, List<String> letters, int letterNum) {
    List<String> newWords = [];

    for (String word in words) {
      bool wordCheck = true;
      for (String letter in letters) {
        if (word[letterNum] == letter) {
          wordCheck = false;
        }
      }
      if (wordCheck) {
        newWords.add(word);
      }
    }
    return newWords;
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
        //print("Letter Num: " + letterNum.toString());
        //print("Word1 Length: " + word1.length.toString());
        //print(returnLetter(word1, letterNum));
        return returnLetter(word1, letterNum);

      case 2:
        return returnLetter(word2, letterNum);

      case 3:
        return returnLetter(word3, letterNum);

      case 4:
        return returnLetter(word4, letterNum);

      case 5:
        return returnLetter(word5, letterNum);

      default:
        return space;
    }
  }

  String returnLetter(String word, int letterNum) {
    try {
      if (word.isEmpty || word == "") {
        return space;
      } else {
        if ((letterNum - 1) >= word.length) {
          print("Giving Space");
          return space;
        } else {
          return word.characters.characterAt(letterNum - 1).toString();
        }
      }
    } on Exception {
      print("error");
      return space;
    }
  }

  void addLetterAtPos(int pos, String letter) {
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

  void removeLetterAtPos(int pos) {
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

  bool isLetterCorrect(int pos, String letter) {
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

  bool areEqual(String letterAtPos, String letterInp) {
    if (letterAtPos.toLowerCase() == letterInp.toLowerCase()) {
      return true;
    } else {
      return false;
    }
  }

  void cleanWords() {
    //Clean the words by making them lower case
    if (upperCase) {
      word1 = word1.toUpperCase();
      word2 = word2.toUpperCase();
      word3 = word3.toUpperCase();
      word4 = word4.toUpperCase();
      word5 = word5.toUpperCase();
    } else {
      word1 = word1.toLowerCase();
      word2 = word2.toLowerCase();
      word3 = word3.toLowerCase();
      word4 = word4.toLowerCase();
      word5 = word5.toLowerCase();
    }
  }

  List<String> cleanList(List<String> wordList) {
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

  List<String> removeUnwantedWords(List<String> words, List<String> letters) {
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

  void displayLetters(String str) {
    clearWords();
    List<String> words = cleanList(makeWords(str));
    for (int i = 0; i < 5; i++) {
      switch (i) {
        case 0:
          word1 = words[i];
          break;
        case 1:
          word2 = words[i];
          break;
        case 2:
          word3 = words[i];
          break;
        case 3:
          word4 = words[i];
          break;
        case 4:
          word5 = words[i];
          break;
      }
    }
    cleanWords();
  }

  void clearWords() {
    word1 = "";
    word2 = "";
    word3 = "";
    word4 = "";
    word5 = "";
  }

  List<String> makeWords(String str) {
    List<String> words = [];
    String curWord = "";
    for (int i = 0; i < 25; i++) {
      if ((i) >= str.length) {
        curWord = curWord + space;
      } else {
        curWord = curWord + str[i];
      }

      if (curWord.length == 5) {
        words.add(curWord);
        curWord = "";
      }
    }

    print("Words: " + words.toString());
    return words;
  }

  static bool wordInList(String word, bool upper) {
    List<String> wordList = allWords3;

    List<String> newWords = [];
    for (String i in wordList) {
      if (upper) {
        newWords.add(i.toUpperCase());
      } else {
        newWords.add(i.toLowerCase());
      }
    }

    if (newWords.contains(word)) {
      return true;
    } else {
      return false;
    }
  }

  void addWord(String word) {
    switch (wordNum) {
      //Add word at Word(wordNum)
      case 1:
        word1 = word;
        break;
      case 2:
        word2 = word;
        break;
      case 3:
        word3 = word;
        break;
      case 4:
        word4 = word;
        break;
      case 5:
        word5 = word;
        break;
    }
    if (wordNum >= 6) {
      wordNum = 6;
    } else {
      wordNum++;
    }
  }

  String clean1Word(String word) {
    if (upperCase) {
      return word.toUpperCase();
    } else {
      return word.toLowerCase();
    }
  }

  void removeWord() {
    String wordHold = "";
    switch (wordNum) {
      case 2: //On word 2, remove the last one
        wordHold = word1;
        word1 = "";

        break;
      case 3:
        wordHold = word2;
        word2 = "";
        break;
      case 4:
        wordHold = word3;
        word3 = "";
        break;
      case 5:
        wordHold = word4;
        word4 = "";
        break;
      case 6:
        wordHold = word5;
        word5 = "";
        break;
    }
    if (wordNum <= 1) {
      wordNum = 1;
    } else {
      wordNum--;
    }
    deleteAllInstancesOfLetter(wordHold);
  }

  void deleteAllInstancesOfLetter(String word) {
    //Check for every word
    List<String> letters = [];

    for (int i = 0; i < word.length; i++) {
      letters.add(word[i]);
    }

    for (String letter in letters) {
      bool delLetter = true;
      if (word1.contains(letter)) {
        delLetter = false;
      }
      if (word2.contains(letter)) {
        delLetter = false;
      }
      if (word3.contains(letter)) {
        delLetter = false;
      }
      if (word4.contains(letter)) {
        delLetter = false;
      }
      if (word5.contains(letter)) {
        delLetter = false;
      }

      if (delLetter) {
        //Delete all instances of letter
        //letterUsed
        // late List<String> includedLetters = [];
        // late List<String> removeLetters = [];
        // late String letter1 = "";
        // late String letter2 = "";
        // late String letter3 = "";
        // late String letter4 = "";
        // late String letter5 = "";

        if (lettersUsed1.contains(letter)) {
          lettersUsed1.remove(letter);
        }
        if (lettersUsed2.contains(letter)) {
          lettersUsed2.remove(letter);
        }
        if (lettersUsed3.contains(letter)) {
          lettersUsed3.remove(letter);
        }
        if (lettersUsed4.contains(letter)) {
          lettersUsed4.remove(letter);
        }
        if (lettersUsed5.contains(letter)) {
          lettersUsed5.remove(letter);
        }

        if (includedLetters.contains(letter)) {
          includedLetters.remove(letter);
        }

        if (removeLetters.contains(letter)) {
          removeLetters.remove(letter);
        }

        if (letter1 == letter) {
          letter1 = "";
        }
        if (letter2 == letter) {
          letter2 = "";
        }
        if (letter3 == letter) {
          letter3 = "";
        }
        if (letter4 == letter) {
          letter4 = "";
        }
        if (letter5 == letter) {
          letter5 = "";
        }
      }
    }

    updatePossibleWords();
  }

  void addUsedLetter(int letterNum, String letter) {
    switch (letterNum) {
      case 1:
        lettersUsed1.add(letter);
        break;
      case 2:
        lettersUsed2.add(letter);
        break;
      case 3:
        lettersUsed3.add(letter);
        break;
      case 4:
        lettersUsed4.add(letter);
        break;
      case 5:
        lettersUsed5.add(letter);
        break;
    }
  }

  void removeUsedLetter(int letterNum, String letter) {
    switch (letterNum) {
      case 1:
        lettersUsed1.remove(letter);
        break;
      case 2:
        lettersUsed2.remove(letter);
        break;
      case 3:
        lettersUsed3.remove(letter);
        break;
      case 4:
        lettersUsed4.remove(letter);
        break;
      case 5:
        lettersUsed5.remove(letter);
        break;
    }
  }

  List<String> rankWords(List<String> wordList) {
    //Grab a list of all letters left in the list
    List<LetterRank> letters = [];

    //Loop for every word
    for (String word in wordList) {
      //Loop for every letter in every word
      for (int i = 0; i < word.length; i++) {
        if (!LetterRank.containsLetter(letters, word[i])) {
          //Add the letter to the list
          letters.add(LetterRank(word[i]));
        } else {
          //Add a point for the
          LetterRank.addPointForLetter(letters, word[i]);
        }
      }
    }

    LetterRank.displayAllLetterRanks(letters);

    List<WordRank> words = [];
    //Rank each word, it only adds points to unique letters
    for (String word in wordList) {
      WordRank wordR = WordRank(word);
      wordR.setRank(letters);
      words.add(wordR);
    }

    WordRank.displayAllWordRanks(words);

    //Sort the words

    List<String> newList = [];

    while (words.length != 0) {

      WordRank highest = words[0];
      for (int e = 0; e < words.length; e ++) {
        //Determine which is the highest
        if (words[e].rank > highest.rank) {
          highest = words[e];
        }
      }

      newList.add(highest.word);
      words.remove(highest);

    }

    return newList;

  }
}

class WordRank {
  late String word;
  int rank = 0;

  WordRank(this.word);

  void setRank(List<LetterRank> letterRanks) {
    List<String> usedLetters = [];
    for (int i = 0; i < word.length; i++) {
      for (int e = 0; e < letterRanks.length; e++) {
        if (word[i] == letterRanks[e].letter && !usedLetters.contains(word[i])) {
          usedLetters.add(word[i]);
          rank += letterRanks[e].rank;
          e = letterRanks.length;
        }
      }
    }
  }

  static void displayAllWordRanks (List<WordRank> list) {
    for (WordRank i in list) {
      print(i.word + " : " + i.rank.toString());
    }
  }

}

class LetterRank {
  late String letter;
  int rank = 1;

  LetterRank(this.letter);

  void addPoint() {
    rank++;
  }

  static bool containsLetter(List<LetterRank> list, String letter) {
    bool verdict = false;
    for (LetterRank i in list) {
      if (i.letter == letter) {
        verdict = true;
      }
    }
    return verdict;
  }

  static void addPointForLetter(List<LetterRank> list, String letter) {
    for (LetterRank i in list) {
      if (i.letter == letter) {
        i.addPoint();
        return;
      }
    }
  }

  static void displayAllLetterRanks (List<LetterRank> list) {
    for (LetterRank i in list) {
      print(i.letter + " : " + i.rank.toString());
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
