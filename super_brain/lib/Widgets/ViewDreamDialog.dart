import 'package:flutter/material.dart';
import 'package:super_brain/Models/DreamItem.dart';
import 'package:super_brain/Widgets/ViewDreamWidget.dart';

class ViewDreamDialog extends StatelessWidget {
  const ViewDreamDialog({Key key, @required this.dreamItem, @required this.onDreamEdited}) : super(key: key);

  final DreamItem dreamItem;

  final DreamEdited onDreamEdited;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: ViewDreamWidget(initialDream: dreamItem, onDreamEdited: onDreamEdited,),
    );
  }
}

typedef DreamEdited = void Function(DreamItem dreamItem);