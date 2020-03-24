
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:super_brain/Models/Reminder.dart';
import 'package:super_brain/Translations.dart';

import 'package:http/http.dart' as http;
import 'package:super_brain/Widgets/Reminders/ReminderWidget.dart';

class RemindersPage extends StatefulWidget {

  RemindersPageState createState() => RemindersPageState();

}

class RemindersPageState extends State<RemindersPage> {
  Future<List<Reminder>> _reminders;
  
  Future<List<Reminder>> fetchReminders() async {
    List<Reminder> result = [];

    final response = await http.get(Translations.of(context).text("reminders_url"));

    if (response.statusCode == 200) {
      List<dynamic> httpExercise = json.decode(response.body);

      for (var exercise in httpExercise) {
        result.add(Reminder.fromJson(exercise));
      }
    } 
    else {
      throw Exception(Translations.of(context).text("reminders_download_failed"));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    if (_reminders == null) {
      _reminders = fetchReminders();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("reminders_title")),
      ),
      body: Container(
        child: FutureBuilder<List<Reminder>>(
          future: _reminders,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return 
                GridView.builder(
                  primary: false,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    crossAxisCount: 2,
                    // childAspectRatio: 3 / 4,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ReminderWidget(reminder: snapshot.data[index]),
                    );
                  },
                
              );
            } 
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      )
    );
  }
}