
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class TipWidget extends StatefulWidget {

  TipWidgetState createState() => TipWidgetState();
}

class TipWidgetState extends State<TipWidget> {
  Future<String> tip;

  Future<String> fetchTip() async {
    final response = await http.get('https://feldrise.com/super_brain/dailyTip');

    if (response.statusCode == 200) {
      return response.body.toString();
    } 
    else {
      throw Exception('Failed to load words');
    }
  }

  @override
  void initState() {
    super.initState();

    tip = fetchTip();
  }

  @override
  Widget build(BuildContext context) {
    return Card (
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.wb_incandescent,
                color: Colors.white,
                size: 64,
              ),
            ),
            Expanded(
              child: Center(
                child: FutureBuilder<String>(
                  future: tip,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return 
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: "Tip of the day: ", style: TextStyle(fontWeight: FontWeight.bold)),
                              new TextSpan(text: snapshot.data)
                            ]
                          )
                        );
                    } 
                    else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}