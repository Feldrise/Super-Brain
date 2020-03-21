
import 'package:flutter/material.dart';
import 'package:super_brain/DatabaseHelper.dart';
import 'package:super_brain/Models/DreamItem.dart';
import 'package:super_brain/Widgets/DreamWidget.dart';
import 'package:super_brain/Widgets/InputDialog.dart';

class DreamsJournalPage extends StatefulWidget {

DreamsJournalPageState createState() => DreamsJournalPageState();

}

class DreamsJournalPageState extends State<DreamsJournalPage> {

  Set<DreamItem> _dreams = Set<DreamItem>();
  bool isLoading = false;

  Future<void> _getAllDreamsFromDatabase() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    
    setState(() {
      isLoading = true;
    });

    Set<DreamItem> toAdd = await helper.queryAllDreams();
    _dreams.addAll(toAdd.toList());

    setState(() {
      isLoading = false;
    });
  }

  void _removeDream(DreamItem dreamItem) async {
    setState(() {
      isLoading = true;
    });

    DatabaseHelper helper = DatabaseHelper.instance;

    await helper.deleteDream(dreamItem.id);

    _dreams.clear();

    Set<DreamItem> toAdd = await helper.queryAllDreams();
    _dreams.addAll(toAdd.toList());

    setState(() {
      isLoading = false;
    });
  }

  void _updateDream(DreamItem dreamItem) async {
    setState(() {
      isLoading = true;
    });

    DatabaseHelper helper = DatabaseHelper.instance;

    await helper.updateDream(dreamItem);

    setState(() {
      isLoading = false;
    });
  }

  void _addDream(String text) async {
    setState(() {
      isLoading = true;
    });

    var now = new DateTime.now();
    String dateSlug ="${now.day.toString().padLeft(2,'0')}/${now.month.toString().padLeft(2,'0')}/${now.year.toString()}";

    DreamItem newDream = DreamItem(
      date: dateSlug,
      text: text
    );

    DatabaseHelper helper = DatabaseHelper.instance;

    await helper.insertDream(newDream);
    _dreams.clear();

    Set<DreamItem> toAdd = await helper.queryAllDreams();
    _dreams.addAll(toAdd.toList());

    setState(() {
      isLoading = false;
    });

  }

  @override
  void initState() {
    super.initState();
    
    _getAllDreamsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Morning > Dreams Jourrnal"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _dreams.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: DreamWidget(initialDream: _dreams.toList()[_dreams.length - 1 - index], onDreamRemovedRemoved: _removeDream, onDreamEdited: _updateDream,),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String text = await InputDialog.asyncStringDialog(
              context,
              'Enter the dream content',
              'Dream Content',
              'eg. Pets, Game...',
              '');
          if (text.isNotEmpty) {
            _addDream(text);
          }
        },
        tooltip: 'Add Dream',
        child: Icon(Icons.add),
      ),
    );
  }
}