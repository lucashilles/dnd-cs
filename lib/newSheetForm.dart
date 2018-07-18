import 'package:flutter/material.dart';
import 'package:dnd_cs/tabs/charInfo.dart';
import 'package:dnd_cs/tabs/charSkills.dart';
import 'package:dnd_cs/tabs/charEquip.dart';

class NewSheetForm extends StatefulWidget {
  @override
  _NewSheetFormState createState() => new _NewSheetFormState();
}

class _NewSheetFormState extends State<NewSheetForm> with SingleTickerProviderStateMixin{
  TabController controller;

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dados do personagem'),
        backgroundColor: Colors.amber,
        bottom: getTabBar(),
      ),
      body: getTabBarView(<Widget>[new CharInfo(), new CharSkills(), new CharEquip()]),
    );
  }

}