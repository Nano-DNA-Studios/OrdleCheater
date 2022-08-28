//import 'dart:ffi';

//import 'dart:html';
import 'dart:convert';
import 'dart:io' show File, Platform, stderr;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ordlecheater/SettingsPage.dart';
import 'package:ordlecheater/WordleClass.dart';
import 'package:ordlecheater/icomoon_icons.dart';
import 'package:ordlecheater/my_icons_icons.dart';
import 'package:ordlecheater/WordClass.dart';
import 'package:ordlecheater/supportPage.dart';

import 'LetterBox.dart';
import 'UIManipulation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const NavPage(),
    );
  }
}

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPage();
}

class _NavPage extends State<NavPage> {
  int _index = 0;

  static const List<Widget> _screens = <Widget>[
    WordlePage(),
    SupportPage(),
    Settings(),
  ];

  void _changeNav(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icomoon.wordle), label: "Wordle"),
          BottomNavigationBarItem(icon: Icon(Icomoon.star), label: "Support"),
          BottomNavigationBarItem(icon: Icon(Icomoon.settings), label: "Settings"),
        ],
        currentIndex: _index,
        onTap: _changeNav,
      ),
    );
  }
}


/*
class WordlePage extends StatefulWidget {
  const WordlePage({Key? key}) : super(key: key);

  @override
  State<WordlePage> createState() => _WordlePage();
}

class _WordlePage extends State<WordlePage> {
  WordleClass wordleClass = WordleClass();

  double getScreenHeight () {
    return MediaQuery.of(context).size.height;
  }

  double GetScreenWidthPix() {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text("Wordle"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 0, top: GetScreenWidthPix() * 0.05, right: 0, bottom: 0),
            scrollDirection: Axis.vertical,
            child: Column(

              children: [
               WordRow(word: "Hello", wordleClass: wordleClass,),
             //   WordRow(word: "Stair", wordleClass: wordleClass,),
               // WordRow(word: "Words", wordleClass: wordleClass,),
              //  WordRow(word: "Weird", wordleClass: wordleClass,),
             //   WordRow(word: "Glues", wordleClass: wordleClass,),
               //Words(
                //  dataClass: wordleClass,
              //  ),

              ],
            )));
  }
}

 */


/*
class WordRow extends StatefulWidget {
  WordRow({Key? key, required this.word}) : super(key: key);

 // final WordleClass wordleClass;
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








 /*
class Words extends StatefulWidget {
  const Words({/*required this.hello,*/ Key? key, required this.dataClass})
      : super(key: key);

//final double idk;
  final double widthFacPhone = 0.95;
  final double widthFacWeb = 0.7;

  final WordleClass dataClass;

  // final Widget hello;

  @override
  State<Words> createState() => _Words();
}

class _Words extends State<Words> {
  String text = "Nothing";

  double GetWidthFac() {
    if (kIsWeb) {
      return widget.widthFacWeb;
    } else {
      //Phones and Other Platforms
      return widget.widthFacPhone;
    }
  }

  double GetWidthPix() {
    return MediaQuery.of(context).size.width * GetWidthFac();
  }

  double GetScreenWidthPix() {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight () {
    return MediaQuery.of(context).size.height;
  }

  fetchFileData() async {
    String path = "assets/Words";
    String TextW;
    TextW = await rootBundle.loadString(path);

    setState(() {
      text = TextW;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 0, top: getScreenHeight() * 0.1, right: 0, bottom: 0),
      child: FractionallySizedBox(
        widthFactor: GetWidthFac(),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(GetScreenWidthPix() * 0.05),
          decoration: const BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Expanded(child: widget.dataClass.buildGridView()),
        ),
      ),
    )
      ;


  */
/*
    return FractionallySizedBox(
      widthFactor: GetWidthFac(),
      child: Expanded(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          padding: EdgeInsets.all(GetScreenWidthPix() * 0.05),
          child: widget.dataClass.buildGridView()


          Column(
            children: [
              Row(
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
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  )
                ],
              ),
              WordRow(word: "Hello"),
              WordRow(word: "Hello"),
              WordRow(word: "Hello"),
              WordRow(word: "Hello"),
              WordRow(word: "Hello"),
              Text(text)
            ],


          ),




        ),
      ),
    );


  }
}

 */

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

 */


