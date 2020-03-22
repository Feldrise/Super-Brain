
import 'package:flutter/material.dart';
import 'package:super_brain/Translations.dart';

class RemindersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("reminders_title")),
      ),
      body: Container(
        color: Colors.red,
      )
    );
  }
}