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
      debugShowCheckedModeBanner: false,
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


