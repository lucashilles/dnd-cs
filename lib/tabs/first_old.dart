import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  FirstState createState() => new FirstState();
}

class FirstState extends State<First> with SingleTickerProviderStateMixin{
  final FocusNode fieldsFocus = FocusNode();
  void unFocus() {
    fieldsFocus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    //unFocus();
    return new Container(
      child: new SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // new Icon(
            //   Icons.favorite,
            //   size: 160.0,
            //   color: Colors.red,
            // ),
            // new Text('First Tab'),
            new TextField(
              decoration: new InputDecoration(labelText: 'Nome:'),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                    child: new Text('Raça:'),
                  ),
                  new Flexible(
                    child: DropdownButton(
                      items: [
                        new DropdownMenuItem(
                          child: new Text('Humano'),
                        ),
                        new DropdownMenuItem(
                          child: new Text('Elfo'),
                        ),
                        new DropdownMenuItem(
                          child: new Text('Anão'),
                        ),
                      ],
                      onChanged: (var text) {
                        print(text);
                      },
                    ),
                  ),
                  new Flexible(
                    child: new Text('Classe:'),
                  ),
                  new Flexible(
                    child: DropdownButton(
                      items: [
                        new DropdownMenuItem(
                          child: new Text('Bárbaro'),
                        ),
                        new DropdownMenuItem(
                          child: new Text('Clérico'),
                        ),
                        new DropdownMenuItem(
                          child: new Text('Paladino'),
                        ),
                      ],
                      onChanged: (var text) {
                        print(text);
                      },
                    ),
                  ),
                ],
              ),
            ),
            new TextField(
              decoration: new InputDecoration(labelText: 'Alinhamento:'),
            ),
            new TextField(
              decoration: new InputDecoration(labelText: 'Idiomas:'),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(labelText: 'Nível:', hintText: '1'),
                    //textAlign: TextAlign.center,
                  ),
                ),
                new Flexible(
                  child: new Text('Sexo:'),
                ),
                new Expanded(
                  child: DropdownButton(
                    items: [
                      new DropdownMenuItem(
                        child: new Text('Homem'),
                      ),
                      new DropdownMenuItem(
                        child: new Text('Mulher'),
                      ),
                    ],
                    onChanged: (var text) {
                      print(text);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
