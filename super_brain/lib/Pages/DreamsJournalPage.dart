
import 'package:flutter/material.dart';
import 'package:super_brain/Items/DreamItem.dart';
import 'package:super_brain/Widgets/DreamWidget.dart';

class DreamsJournalPage extends StatefulWidget {

DreamsJournalPageState createState() => DreamsJournalPageState();

}

class DreamsJournalPageState extends State<DreamsJournalPage> {

  final _dreams = Set<DreamItem>();

  @override
  void initState() {
    super.initState();

    _dreams.add(DreamItem(date: "17/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    _dreams.add(DreamItem(date: "18/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    _dreams.add(DreamItem(date: "19/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    _dreams.add(DreamItem(date: "20/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
    _dreams.add(DreamItem(date: "21/03/2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a nibh ut ipsum fermentum dignissim..."));
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
              title: DreamWidget(initialDream: _dreams.toList()[index],),
            );
          },
        ),
      ),
    );
  }
}