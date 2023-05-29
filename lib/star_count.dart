import 'package:flutter/material.dart';

class StarCountProvider extends ChangeNotifier {
  int _star_count = 0;
  get getstarcount => _star_count;

  void updateStarCount(int count) {
    _star_count = count;

    notifyListeners();
  }
}
