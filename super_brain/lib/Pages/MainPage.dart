import 'package:flutter/material.dart';
import 'package:super_brain/Pages/HomePage.dart';
import 'package:super_brain/Pages/MorningPage.dart';
import 'package:super_brain/Pages/RemindersPage.dart';

class MainPage extends StatefulWidget {

  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 1;

  final List<Widget> _children = [
    MorningPage(),
    HomePage(),
    RemindersPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Super Brain'),
     ),
     body: Padding(
       padding: EdgeInsets.all(8.0),
       child: _children[_currentIndex],
     ),
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped,
       currentIndex: _currentIndex, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.brightness_5),
           title: new Text('Morning'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.notifications),
           title: Text('Reminders')
         )
       ],
     ),
   );
  }

}