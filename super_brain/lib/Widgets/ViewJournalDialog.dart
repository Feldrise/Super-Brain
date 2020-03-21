import 'package:flutter/material.dart';
import 'package:super_brain/Models/JournalItem.dart';
import 'package:super_brain/Widgets/JournalWidget.dart';
import 'package:super_brain/Widgets/ViewJournalWidget.dart';

class ViewJournalDialog extends StatelessWidget {
  const ViewJournalDialog({Key key, @required this.journalItem, @required this.onJournalEdited}) : super(key: key);

  final JournalItem journalItem;

  final JournalEdited onJournalEdited;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: ViewJournalWidget(initialJournal: journalItem, onJournalEdited: onJournalEdited,),
    );
  }
}

typedef JournalEdited = void Function(JournalItem journalItem);