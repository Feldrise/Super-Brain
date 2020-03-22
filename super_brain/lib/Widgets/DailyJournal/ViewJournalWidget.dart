import 'package:flutter/material.dart';
import 'package:super_brain/Models/JournalItem.dart';
import 'package:super_brain/Translations.dart';
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
                    Translations.of(context).text("dialog_journal_title_description"),
                    Translations.of(context).text("dialog_journal_title_title"),
                    Translations.of(context).text("dialog_journal_title_exemple"),
                    journalItem.content);
                if (text.isNotEmpty) {
                  setState(() {
                    journalItem.content = text;
                  });

                  widget.onJournalEdited(journalItem);
                }
              }, 
              child: Text(Translations.of(context).text("edit_title"))
            ),
            FlatButton(
              onPressed: () async {
                final String text = await InputDialog.asyncStringDialog(
                    context,
                    Translations.of(context).text("dialog_journal_content_description"),
                    Translations.of(context).text("dialog_journal_content_title"),
                    Translations.of(context).text("dialog_journal_content_exemple"),
                    journalItem.title);
                if (text.isNotEmpty) {
                  setState(() {
                    journalItem.title = text;
                  });

                  widget.onJournalEdited(journalItem);
                }
              }, 
              child: Text(Translations.of(context).text("edit_content"))
            ),
          ],
        ),
      ),
    );
  }
}

typedef JournalEdited = void Function(JournalItem journalItem);