import 'package:dnd_cs/numberSpinner.dart';
import 'package:flutter/material.dart';

class CharSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO Adicionar formulario de habilidades
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.assessment,
              size: 160.0,
              color: Colors.red,
            ),
            new Text('Second Tab'),
            new NumberSpinner(
              onChanged: (T) {},
            ),
          ],
        ),
      ),
    );
  }
}