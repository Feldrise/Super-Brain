import 'package:flutter/material.dart';
import 'package:super_brain/Models/JournalItem.dart';
import 'package:super_brain/Widgets/InputDialog.dart';

class ViewJournalWidget extends StatefulWidget {
  const ViewJournalWidget({Key key, @required this.initialJournal, @required this.onJournalEdited}) : super(key: key);

  final JournalItem initialJournal;

  final JournalEdited onJournalEdited;
  
  ViewJournalWidgetState createState() => ViewJournalWidgetState();
}

class ViewJournalWidgetState extends State<ViewJournalWidget> {
  JournalItem journalItem;

  @override
  void initState() {
    super.initState();

    journalItem = widget.initialJournal;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(journalItem.title, style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 24),
            Expanded(
              child: Text(journalItem.content), 
            ),
            FlatButton(
              onPressed: () async {
                final String text = await InputDialog.asyncStringDialog(
                    context,
                    'Enter the journal content',
                    'Journal Content',
                    'eg. Todo : x; NoTodo : x...',
                    journalItem.content);
                if (text.isNotEmpty) {
                  setState(() {
                    journalItem.content = text;
                  });

                  widget.onJournalEdited(journalItem);
                }
              }, 
              child: Text("Edit Content")
            ),
            FlatButton(
              onPressed: () async {
                final String text = await InputDialog.asyncStringDialog(
                    context,
                    'Enter the journal title',
                    'Journal Title',
                    'eg. How I Love Her...',
                    journalItem.title);
                if (text.isNotEmpty) {
                  setState(() {
                    journalItem.title = text;
                  });

                  widget.onJournalEdited(journalItem);
                }
              }, 
              child: Text("Edit Title")
            ),
          ],
        ),
      ),
    );
  }
}

typedef JournalEdited = void Function(JournalItem journalItem);