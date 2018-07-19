import 'package:flutter/material.dart';

class CharInfo extends StatefulWidget {
  @override
  _CharInfoState createState() => new _CharInfoState();
}

class _CharInfoState extends State<CharInfo>{
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _nome = '';

  List<String> _races = <String>[
    'Anão',
    'Duende',
    'Gnomo',
    'Meio elfo',
    'Meio-orc',
    'Halfling',
    'Humano'
  ];
  List<String> _classes = <String>[
    'Bárbaro',
    'Bardo',
    'Clérigo',
    'Druida',
    'Lutador',
    'Monge',
    'Paladino',
    'Ranger',
    'Rogue',
    'Sorcerer',
    'Warlock',
    'Wizard'
  ];
  String _race = 'Anão';
  String _classe = 'Bárbaro';
  int _sexo = 0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              new TextField(
                onChanged: (String nome) {
                  setState(() {
                    _nome = nome;
                  });
                },
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Seu nome',
                  labelText: 'Nome',
                ),
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.whatshot),
                  hintText: 'Neutro',
                  labelText: 'Alinhamento',
                ),
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.translate),
                  hintText: 'Idioma comum',
                  labelText: 'Idiomas',
                ),
              ),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.trending_up),
                  //hintText: 'Idioma comum',
                  labelText: 'Nível',
                ),
              ),
              new InputDecorator(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.face),
                  labelText: 'Raça',
                ),
                //isEmpty: _race == '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _race,
                    isDense: true,
                    onChanged: (String newValue) {},
                    items: _races.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              new InputDecorator(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.assignment_ind),
                  labelText: 'Classe',
                ),
                //isEmpty: _class == '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _classe,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        _classe = newValue;
                      });
                    },
                    items: _classes.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              new InputDecorator(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.wc),
                  labelText: 'Sexo',
                  border: InputBorder.none,
                ),
                child: new Row(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text('Homem'),
                        new Radio(
                          value: 0,
                          groupValue: _sexo,
                          onChanged: (int value) {
                            setState(() {
                              _sexo = value;
                            });
                          },
                        ),
                      ],
                    ),
                    new SizedBox(width: 15.0,),
                    new Row(
                      children: <Widget>[
                        new Text('Mulher'),
                        new Radio(
                          value: 1,
                          groupValue: _sexo,
                          onChanged: (int value) {
                            setState(() {
                              _sexo = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
