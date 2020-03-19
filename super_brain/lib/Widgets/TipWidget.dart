
import 'dart:ui';

import 'package:flutter/material.dart';

class TipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card (
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.wb_incandescent,
                color: Theme.of(context).accentColor,
                size: 64,
              ),
            ),
            Expanded(
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black87
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: "Tip of the day: ", style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "Remember to sleep, cause sleep is really important for your brain. You should sleep in a completly dark place, without any work and cold.")
                    ]
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}