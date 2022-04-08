import 'package:flutter/material.dart';

class AnimationProvider extends ChangeNotifier {
  late AnimationController _controller;
  int countNotify = 0;

  void increment() {
    if (countNotify >= 99) countNotify = 0;
    countNotify++;

    if (countNotify >= 2) {
      _controller.forward(from: 0);
    }

    notifyListeners();
  }

  AnimationController get controller => _controller;

  set controller(AnimationController value) {
    _controller = value;
    // notifyListeners();
  }
}
