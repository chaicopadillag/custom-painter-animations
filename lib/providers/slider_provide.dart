import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _currentIndex = 0.0;

  double get currentIndex => _currentIndex;

  set currentIndex(double value) {
    _currentIndex = value;

    notifyListeners();
  }
}
