import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';

class FileManager {
  Future<String> get _tmpPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _dataFile async {
    final path = await _localPath;
    return File('$path/data.js');
  }

  Future<File> get _createDataFile async {
    final path = await _localPath;
    return File('$path/data.js').create();
  }

  Future<String> readData() async {
    try {
      File file = await _dataFile;
      if (!file.existsSync()) {
        print('Criando arquivo de dados');
        file = await _createDataFile;
      }
      print('Lendo dados do arquivo');
      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      return null;
    }
  }

  Future<File> writeData(String data) async {
    final file = await _dataFile;

    return file.writeAsString('$data');
  }
}
