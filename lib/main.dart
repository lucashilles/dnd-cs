import 'package:dnd_cs/testScreen.dart';
import 'package:flutter/material.dart';
import 'package:dnd_cs/newSheetForm.dart';
import 'package:dnd_cs/src/fileManager.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'D&D Char Sheet'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.arrow_forward),
                  title: const Text('Legolas'),
                  onLongPress: () {
                    print('Long Press Range');
                  },
                ),
                new ListTile(
                  leading: const Icon(Icons.arrow_forward),
                  title: const Text('Dovahkiin'),
                  onLongPress: () {
                    print('Long Press Dashboard');
                  },
                ),
                new ListTile(
                  leading: const Icon(Icons.arrow_forward),
                  title: const Text('He-man'),
                  onLongPress: () {
                    print('Long Press Hub');
                  },
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(20.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text(
                      'Criar nova ficha',
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewSheetForm()),
                      );
                    },
                  ),
                ],
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(20.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text(
                      'Testar arquivo',
                    ),
//                    onPressed: () {
//                      FileManager fileManager = new FileManager();
//                      String _fileData;
//
//                      fileManager.readData().then((String data) {
//                        _fileData = data;
//                        print("Data from file: " + _fileData);
//                      });
//                    },
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
