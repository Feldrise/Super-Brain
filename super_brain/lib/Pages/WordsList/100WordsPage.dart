
import 'package:flutter/material.dart';
import 'package:super_brain/Translations.dart';
import 'package:super_brain/Widgets/TitleWidget.dart';
import 'package:super_brain/Widgets/WordWidget.dart';

import 'package:http/http.dart' as http;

class UndreadWordsPage extends StatefulWidget {
  UndreadWordsPageState createState() => UndreadWordsPageState();
}

class UndreadWordsPageState extends State<UndreadWordsPage> {
  Future<List<String>> futureWords;

  Future<List<String>> fetchWords() async {
    final response = await http.get('https://feldrise.com/super_brain/100words');

    if (response.statusCode == 200) {
      return response.body.toString().split(",");
    } 
    else {
      throw Exception('Failed to load words');
    }
  }

  @override
  void initState() {
    super.initState();

    futureWords = fetchWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("home_title") + " > " + Translations.of(context).text("100words_list")),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TitleWidget(title: Translations.of(context).text("100words_list")),
            Container(
              child: FutureBuilder<List<String>>(
                future: futureWords,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return 
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: WordWidget(number: "${index + 1}", word: "${snapshot.data[index]}",),
                              // title: Text("$index. ${words[index]}")
                            );
                          }
                        ),
                      );
                  } 
                  else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}