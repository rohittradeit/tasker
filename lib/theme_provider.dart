import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier{
  Color mainColor = Colors.blue;
    double progress = 0;

  void changeThemeColor(Color color) {
    mainColor = color;
    notifyListeners();
  }
}