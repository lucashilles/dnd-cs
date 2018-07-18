import 'dart:convert';
import 'package:dnd_cs/src/sheet.dart';

class SheetJSON {
  Sheet _fromJson(String json) {
    Map<String, dynamic> map = JSON.decode(json);
    var sheet = new Sheet();
    sheet.nome = map['nome'];
    sheet.alinhamento = map['alinhamento'];
    sheet.idiomas = map['idiomas'];
    sheet.nivel = int.parse(map['nivel']);
    sheet.race = map['race'];
    sheet.classe = map['classe'];
    sheet.sexo = int.parse(map['sexo']);
    return sheet;
  }

  String _toJson(Sheet sheet) {
    var mapData = new Map();
    mapData['nome'] = sheet.nome;
    mapData['alinhamento'] = sheet.alinhamento;
    mapData['idiomas'] = sheet.idiomas;
    mapData['nivel'] = sheet.nivel;
    mapData['race'] = sheet.race;
    mapData['classe'] = sheet.classe;
    mapData['sexo'] = sheet.sexo;
    String jsonStr = json.encode(mapData);
    return jsonStr;
  }
}