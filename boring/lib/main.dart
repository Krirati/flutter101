import 'package:boring/constants.dart';
import 'package:flutter/material.dart';
import 'package:boring/splash_screen.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(
      fontFamily: "Prompt"
    ),
    home: Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: MyApp(),
      )
    ) 
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}