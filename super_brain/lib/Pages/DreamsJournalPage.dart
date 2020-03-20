
import 'package:flutter/material.dart';
import 'package:super_brain/DatabaseHelper.dart';
import 'package:super_brain/Models/DreamItem.dart';
import 'package:super_brain/Widgets/DreamWidget.dart';

class DreamsJournalPage extends StatefulWidget {

DreamsJournalPageState createState() => DreamsJournalPageState();

}

class DreamsJournalPageState extends State<DreamsJournalPage> {

  Set<DreamItem> _dreams = Set<DreamItem>();
  bool isLoading = false;

  Future<void> getAllDreamsFromDatabase() async {
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

  void removeDream(DreamItem dreamItem) async {
    setState(() {
      isLoading = true;
    });

    DatabaseHelper helper = DatabaseHelper.instance;

    await helper.delete(dreamItem.id);

    _dreams.clear();

    Set<DreamItem> toAdd = await helper.queryAllDreams();
    _dreams.addAll(toAdd.toList());

    setState(() {
      isLoading = false;
    });
  }

  void updateDream(DreamItem dreamItem) async {
    setState(() {
      isLoading = true;
    });

    DatabaseHelper helper = DatabaseHelper.instance;

    await helper.update(dreamItem);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    
    getAllDreamsFromDatabase();
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
              title: DreamWidget(initialDream: _dreams.toList()[index], onDreamRemovedRemoved: removeDream, onDreamEdited: updateDream,),
            );
          },
        ),
      ),
    );
  }
}