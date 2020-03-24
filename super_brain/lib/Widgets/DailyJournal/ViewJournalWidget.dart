import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 82, // 66 + 16,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 66),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                journalItem.title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    journalItem.content,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
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
                      child: Text(Translations.of(context).text("edit_content"), style: TextStyle(color: Theme.of(context).accentColor))
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
                      child: Text(Translations.of(context).text("edit_title"), style: TextStyle(color: Theme.of(context).accentColor))
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text(Translations.of(context).text("ok"), style: TextStyle(color: Theme.of(context).accentColor),),
                    ),
                  ],
                ),
                // child: FlatButton(
                //   onPressed: () {
                //     Navigator.of(context).pop(); // To close the dialog
                //   },
                //   child: Text(Translations.of(context).text("ok"), style: TextStyle(color: Theme.of(context).accentColor),),
                // ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 66,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: SvgPicture.asset(
                'assets/icon/icon.svg',
                semanticsLabel: "Icon",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

typedef JournalEdited = void Function(JournalItem journalItem);