import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dnd_cs/tabs/charInfo.dart';
import 'package:dnd_cs/tabs/charSkills.dart';
import 'package:dnd_cs/tabs/charEquip.dart';

class NewSheetForm extends StatefulWidget {
  @override
  _NewSheetFormState createState() => new _NewSheetFormState();
}

class _NewSheetFormState extends State<NewSheetForm> {
  CharInfo charInfoTab = new CharInfo();
  CharSkills charSkillsTab = new CharSkills();
  CharEquip charEquipTab = new CharEquip();

  Future<bool> _closeConfirm() {
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
                    return Future.value(false);
                  },
                  child: new Text('Não')),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    return Future.value(true);
                  },
                  child: new Text('Descartar')),
            ],
          ),
    );
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _closeConfirm,
      child: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Dados do personagem'),
            bottom: new TabBar(
              tabs: [
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
            ),
          ),
          body: TabBarView(
              physics: new NeverScrollableScrollPhysics(),
              children: [charInfoTab, charSkillsTab, charEquipTab]),
        ),
      ),
    );
  }
}
