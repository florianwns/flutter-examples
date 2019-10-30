import 'package:flutter/material.dart';

class P4Control extends ChangeNotifier {
  Offset _touch;
  Offset get touch => _touch;

  bool _enabled = true;

  bool get isEnabled => _enabled;
  bool get isValid => _touch != null;

  void unblock(){
    _enabled = true;
    notifyListeners();
  }

  void block() {
    _touch = null;
    _enabled = false;
    notifyListeners();
  }

  void update(Offset pos, double width) {
    assert(pos != null);
    assert(width != null);

    // Don't drop a pion when user leave the grid
    _touch = (pos.dx < 0 || pos.dx >= width || pos.dy < 0 || pos.dy >= width)
        ? null
        : pos;
    notifyListeners();
  }
}
