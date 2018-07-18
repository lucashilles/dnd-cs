import 'package:flutter/material.dart';
import 'package:dnd_cs/tabs/charInfo.dart';
import 'package:dnd_cs/tabs/charSkills.dart';
import 'package:dnd_cs/tabs/charEquip.dart';
import 'package:dnd_cs/src/sheet.dart';

class NewSheetForm extends StatefulWidget {
  @override
  _NewSheetFormState createState() => new _NewSheetFormState();
}

class _NewSheetFormState extends State<NewSheetForm>
    with SingleTickerProviderStateMixin {
  TabController controller;
  Sheet sheet = new Sheet();

  _closeConfirm() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (_) => new AlertDialog(
            title: new Text('Cuidado!'),
            content: new Text('Deseja sair e descartar as alterações?'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text('Não')),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: new Text('Descartar')),
            ],
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      tabs: <Tab>[
        new Tab(
          icon: new Icon(Icons.perm_identity),
        ),
        new Tab(
          icon: new Icon(Icons.description),
        ),
        new Tab(
          icon: new Icon(Icons.work),
        ),
      ],
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      children: tabs,
      controller: controller,
      physics: new NeverScrollableScrollPhysics(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _closeConfirm,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Dados do personagem'),
          backgroundColor: Colors.amber,
          bottom: getTabBar(),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.check),
                onPressed: () {
                  print('Salvando');
                }),
          ],
        ),
        body: getTabBarView(
            <Widget>[new CharInfo(), new CharSkills(), new CharEquip()]),
      ),
    );
  }
}
