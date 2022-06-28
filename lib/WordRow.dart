

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'LetterBox.dart';
import 'WordleClass.dart';

/*
class WordRow extends StatefulWidget {
  WordRow({Key? key, required this.word, required this.wordleClass}) : super(key: key);

  final WordleClass wordleClass;
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
