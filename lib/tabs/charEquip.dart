import 'package:flutter/material.dart';

class CharSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.business_center,
              size: 160.0,
              color: Colors.red,
            ),
            new Text('Second Tab'),
          ],
        ),
      ),
    );
  }
}