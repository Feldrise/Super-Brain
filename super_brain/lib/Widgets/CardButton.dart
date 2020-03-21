
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {

  const CardButton({Key key, this.icon, this.title, this.destinationPage, this.onPush}) : super(key: key);

  final IconData icon;
  final String title;
  final String destinationPage;
  final ValueChanged<String> onPush;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPush(destinationPage),
      child: Card( 
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 16.0, bottom: 0.0),
                child: Icon(icon, color: Theme.of(context).primaryColor, size: 32,),
              ),
              Expanded(
                child: Text(title),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 16.0, bottom: 0.0),
                child: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor, size: 24,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}