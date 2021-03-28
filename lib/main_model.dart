import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String txt = 'テキスト';

  void changeText() {
    txt = 'テキスト変更';
    notifyListeners();
  }
}