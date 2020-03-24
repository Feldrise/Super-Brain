import 'package:flutter/material.dart';
import 'package:super_brain/Models/Reminder.dart';
import 'package:super_brain/Widgets/Reminders/ReminderDialog.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget({Key key, this.reminder}) : super(key: key);
  
  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        showDialog(
          context: context,
          builder: (BuildContext context) => ReminderDialog(reminder: reminder),
        )
      },
      child: Card( 
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(reminder.title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              SizedBox(height: 8,),
              Expanded(child: Center(child: Text(reminder.summary, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 7,)))
            ],
          )
        ),
      ),
    );
  }
}