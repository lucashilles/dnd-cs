import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dnd_cs/tabs/charInfo.dart';
import 'package:dnd_cs/tabs/charSkills.dart';
import 'package:dnd_cs/tabs/charEquip.dart';

class NewSheetForm extends StatefulWidget {
  @override
  _NewSheetFormState createState() => new _NewSheetFormState();
}

class _NewSheetFormState extends State<NewSheetForm>
    with SingleTickerProviderStateMixin {
  CharInfo _charInfoTab = new CharInfo();
  CharSkills _charSkillsTab = new CharSkills();
  CharEquip _charEquipTab = new CharEquip();

  TabController _controller;

  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

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
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this, initialIndex: 0);
    _controller.addListener(_dismissKeyboard);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _closeConfirm,
      child: new Scaffold(
        appBar: new AppBar(
          title: const Text('Dados do personagem'),
          backgroundColor: Colors.lightGreen,
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
          bottom: new TabBar(
            controller: _controller,
            tabs: [
              new Tab(
                icon: const Icon(Icons.perm_identity),
              ),
              new Tab(
                icon: const Icon(Icons.description),
              ),
              new Tab(
                icon: new Icon(Icons.work),
              ),
            ],
          ),
        ),
        body: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [_charInfoTab, _charSkillsTab, _charEquipTab]),
      ),
    );
  }
}
