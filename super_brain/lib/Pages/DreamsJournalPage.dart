
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

  Future<void> createDatabase() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int id1 = await helper.insert(DreamItem(date: "17/03/2020", text: "First Dream. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    int id2 = await helper.insert(DreamItem(date: "18/03/2020", text: "Second Dream. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    int id3 = await helper.insert(DreamItem(date: "19/03/2020", text: "Third Dream. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    int id4 = await helper.insert(DreamItem(date: "20/03/2020", text: "Fourth Dream. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));

  }

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
    _dreams.remove(dreamItem);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    
    // _dreams.add(DreamItem(date: "17/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    // _dreams.add(DreamItem(date: "18/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    // _dreams.add(DreamItem(date: "19/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    // _dreams.add(DreamItem(date: "20/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    // _dreams.add(DreamItem(date: "21/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));

    getAllDreamsFromDatabase();
    // createDatabase();
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
              title: DreamWidget(initialDream: _dreams.toList()[index], onDreamRemovedRemoved: removeDream,),
            );
          },
        ),
      ),
    );
  }
}