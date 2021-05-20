import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  int _currentIndex = 0;
  int _detailCategoryIndex = 0;

  int get currentIndex => _currentIndex;
  int get detailCategoryIndex => _detailCategoryIndex;

  void setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void setDetailCategoryIndex(int value) {
    _detailCategoryIndex = value;
    notifyListeners();
  }
}