
import 'package:flutter/material.dart';
import 'package:super_brain/Pages/WordsList/10WordsPage.dart';

class CardButton extends StatelessWidget {

  const CardButton({Key key, this.icon, this.title, this.destinationPage}) : super(key: key);

  final IconData icon;
  final String title;
  final String destinationPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TenWordsPage()),
        )
      },
      child: Card( 
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 16.0, bottom: 0.0),
                child: Icon(icon, color: Colors.black54, size: 32,),
              ),
              Expanded(
                child: Text(title),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 16.0, bottom: 0.0),
                child: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 24,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}