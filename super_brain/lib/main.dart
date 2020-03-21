import 'package:flutter/material.dart';
import 'package:super_brain/Pages/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xff23272F),
        primaryColor: Color(0xff2C313B),
        accentColor: Color(0xff2A8CF8),
        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          title: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),

        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Colors.white,
          margin: EdgeInsets.all(12)
        ),
      ),
      home: MainPage(),
    );
  }
}