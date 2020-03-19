
import 'package:flutter/material.dart';

class WordWidget extends StatelessWidget {

  const WordWidget({Key key, this.number, this.word}) : super(key: key);

  final String number;
  final String word;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 16.0, bottom: 0.0),
              child: Text(number + "."),
            ),
            Expanded(
              child: Text(word),
            ),
          ],
        ),
      ),
    );
  }
}