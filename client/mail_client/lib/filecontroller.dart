import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FileController {
  late File file = getApplicationDocumentsDirectory().then((dir) { return File(dir.path + "assets/data/auth.txt"); });
  FileeController () {
    getApplicationDocumentsDirectory().then((dir) {
      file = File(dir.path + "assets/data/auth.txt");
      print("Done");
    });
  }

  List<String> readFile() {
    print("hello");
    List<String> lines = file.readAsLinesSync();
    if (lines == []) return List.empty();
    return lines;

  }

  void clearFile() {
    rootBundle.loadString("assets/data/auth.txt").then ( (v) {
      // File file = File("data/auth.txt");
      // file.writeAsBytes([]);
    });
  }
  
  void writeFile(String login, String password) {
    rootBundle.loadString("assets/data/auth.txt").then ( (v) {
      // File file = File("data/auth.txt");
      // file.writeAsString(login + '\n' + password);
    });
  }

}