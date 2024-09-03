import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  String content = "";
  List<String> verses = [];

  readFiles(String index) async {
    String text = await rootBundle.loadString("assets/files/$index.txt");
    content = text;
    verses = content.split("\n");
    notifyListeners();
    print(text);
  }
}
