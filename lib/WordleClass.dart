//import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:ordlecheater/WordClass.dart';
import 'package:ordlecheater/main.dart';

class WordleClass {

  WordClass wordClass = WordClass();

  late String word1;
  late String word2;
  late String word3;
  late String word4;
  late String word5;

  //Function to generate the 5 word boxes
  //Function to generate the possible words to display

  WordleClass () {
    //Initialize the screen
  }


Widget wordInputs () {

  return Column(
    children: [
      //Word rows


    ],
  );

}


Widget wordRow (String word) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      LetterBox(letter: word.characters.elementAt(0).toString()),
      LetterBox(letter: word.characters.elementAt(1).toString()),
      LetterBox(letter: word.characters.elementAt(2).toString()),
      LetterBox(letter: word.characters.elementAt(3).toString()),
      LetterBox(letter: word.characters.elementAt(4).toString()),
    ],
  );


}

/*
  Widget count() {
//    return Text(possibleWords.length.toString());
  }

 */

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

  Widget buildGridView() => GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: platfromGridNum(),
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return BuildGridWidget(index);
        },
        itemCount: maxNum(.possibleWords.length),
      );


  int maxNum (int length) {

    if (length > 200) {
      return 200;
    } else {
      return length;
    }

  }

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
            possibleWords[index],
            maxLines: 1,
            style: TextStyle(fontSize: platformFontSize()),
          ),
        )

    );
  }

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


class WordlePage extends StatefulWidget {
  const WordlePage(
      {required this.wordClass});

final WordClass wordClass;

  @override
  State<LetterBox> createState() => _WordlePage();
}


class _WordlePage extends State<WordlePage> {


  return



}




