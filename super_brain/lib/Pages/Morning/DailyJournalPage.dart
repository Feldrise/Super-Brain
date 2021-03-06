import 'package:flutter/material.dart';
import 'package:super_brain/DatabaseHelper.dart';
import 'package:super_brain/Models/JournalItem.dart';
import 'package:super_brain/Translations.dart';
import 'package:super_brain/Widgets/InputDialog.dart';
import 'package:super_brain/Widgets/DailyJournal/JournalWidget.dart';
import 'package:super_brain/Widgets/TitleWidget.dart';

class DailyJournalPage extends StatefulWidget {
  DailyJournalPageState createState() => DailyJournalPageState();
}

class DailyJournalPageState extends State<DailyJournalPage> {
  Set<JournalItem> _journals = Set<JournalItem>();
  bool isLoading = false;

  Future<void> _getAllJournalsFromDatabase() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    
    setState(() {
      isLoading = true;
    });

    Set<JournalItem> toAdd = await helper.queryAllJournals();
    _journals.addAll(toAdd.toList());

    setState(() {
      isLoading = false;
    });
  }

  void _removeJournal(JournalItem journalItem) async {
    setState(() {
      isLoading = true;
    });

    DatabaseHelper helper = DatabaseHelper.instance;

    await helper.deleteJournal(journalItem.id);

    _journals.clear();

    Set<JournalItem> toAdd = await helper.queryAllJournals();
    _journals.addAll(toAdd.toList());

    setState(() {
      isLoading = false;
    });
  }

  void _updateJournal(JournalItem journalItem) async {
    setState(() {
      isLoading = true;
    });

    DatabaseHelper helper = DatabaseHelper.instance;

    await helper.updateJournal(journalItem);

    setState(() {
      isLoading = false;
    });
  }

  void _addJournal(String title, String text) async {
    setState(() {
      isLoading = true;
    });

    JournalItem newJournal = JournalItem(
      title: title,
      content: text
    );

    DatabaseHelper helper = DatabaseHelper.instance;

    await helper.insertJournal(newJournal);
    _journals.clear();

    Set<JournalItem> toAdd = await helper.queryAllJournals();
    _journals.addAll(toAdd.toList());

    setState(() {
      isLoading = false;
    });

  }

  @override
  void initState() {
      super.initState();

    // _addJournal("Titre 1", "First. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus elit sit amet tortor consequat posuere. Donec sapien nulla, placerat eget venenatis ut, viverra vitae sem. Phasellus tristique egestas consequat. Nullam convallis nulla sit amet dui efficitur posuere. Nulla bibendum tincidunt nisl sed iaculis. Nulla id erat velit. Nulla mattis massa id quam facilisis, a facilisis eros ullamcorper.");
    // _addJournal("Titre 2", "Second. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus elit sit amet tortor consequat posuere. Donec sapien nulla, placerat eget venenatis ut, viverra vitae sem. Phasellus tristique egestas consequat. Nullam convallis nulla sit amet dui efficitur posuere. Nulla bibendum tincidunt nisl sed iaculis. Nulla id erat velit. Nulla mattis massa id quam facilisis, a facilisis eros ullamcorper.");
    // _addJournal("Titre 3", "Third. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus elit sit amet tortor consequat posuere. Donec sapien nulla, placerat eget venenatis ut, viverra vitae sem. Phasellus tristique egestas consequat. Nullam convallis nulla sit amet dui efficitur posuere. Nulla bibendum tincidunt nisl sed iaculis. Nulla id erat velit. Nulla mattis massa id quam facilisis, a facilisis eros ullamcorper.");
    // _addJournal("Titre 4", "Fourth. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus elit sit amet tortor consequat posuere. Donec sapien nulla, placerat eget venenatis ut, viverra vitae sem. Phasellus tristique egestas consequat. Nullam convallis nulla sit amet dui efficitur posuere. Nulla bibendum tincidunt nisl sed iaculis. Nulla id erat velit. Nulla mattis massa id quam facilisis, a facilisis eros ullamcorper.");
    // _addJournal("Titre 5", "Fifth. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus elit sit amet tortor consequat posuere. Donec sapien nulla, placerat eget venenatis ut, viverra vitae sem. Phasellus tristique egestas consequat. Nullam convallis nulla sit amet dui efficitur posuere. Nulla bibendum tincidunt nisl sed iaculis. Nulla id erat velit. Nulla mattis massa id quam facilisis, a facilisis eros ullamcorper.");
    // _addJournal("Titre 6", "Sixth. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus elit sit amet tortor consequat posuere. Donec sapien nulla, placerat eget venenatis ut, viverra vitae sem. Phasellus tristique egestas consequat. Nullam convallis nulla sit amet dui efficitur posuere. Nulla bibendum tincidunt nisl sed iaculis. Nulla id erat velit. Nulla mattis massa id quam facilisis, a facilisis eros ullamcorper.");

    _getAllJournalsFromDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("morning_title") + " > " + Translations.of(context).text("daily_journal_title")),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TitleWidget(title: Translations.of(context).text("daily_journal_title"),),
            Container(
              child: Expanded(
                child: GridView.builder(
                  primary: false,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: _journals.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: JournalWidget(initialJournal: _journals.toList()[_journals.length - 1 - index], onJournalRemoved: _removeJournal, onJournalEdited: _updateJournal,),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String title = await InputDialog.asyncStringDialog(
              context,
              Translations.of(context).text("dialog_journal_title_description"),
              Translations.of(context).text("dialog_journal_title_title"),
              Translations.of(context).text("dialog_journal_title_exemple"),
              '');

          if (title.isNotEmpty) {
            final String text = await InputDialog.asyncStringDialog(
                  context,
                  Translations.of(context).text("dialog_journal_content_description"),
                  Translations.of(context).text("dialog_journal_content_title"),
                  Translations.of(context).text("dialog_journal_content_exemple"),
                  '');
            
            if (title.isNotEmpty && text.isNotEmpty) {
              _addJournal(title, text);
            }
          }
        },
        tooltip: Translations.of(context).text("add"),
        child: Icon(Icons.add),
      ),
    );
  }
}