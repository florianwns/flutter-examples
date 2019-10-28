import 'package:flutter/material.dart';

class P4Control extends ChangeNotifier {
  Offset touch;

  bool _activated = true;

  bool get isActivated => _activated;
  
  void activate({bool state = true}){
    _activated = state;
    notifyListeners();
  }

  void deactivate() => activate(state : false);

  void update(Offset pos, double width) {
    assert(pos != null);
    assert(width != null);

    // Don't drop a pion when user leave the grid
    touch = (pos.dx < 0 || pos.dx >= width || pos.dy < 0 || pos.dy >= width)
        ? null
        : pos;

    notifyListeners();
  }

  void release() {
    if (touch != null) {
      touch = null;
      deactivate();
    }
  }

}
