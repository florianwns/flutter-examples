import 'package:flutter/material.dart';

class P4Control extends ChangeNotifier {
  bool _enabled = true;
  bool get isEnabled => _enabled;
  bool get isNotEnabled => !isEnabled;

  Offset _touch;
  Offset get touch => _touch;
  set touch(Offset touch) {
    _touch = touch;
    if (isEnabled) {
      notifyListeners();
    }
  }
  void release() => _touch = null;

  bool get isValid => _touch != null;
  bool get isNotValid => !isValid;

  void activate() {
    _enabled = true;
    notifyListeners();
  }

  void deactivates() {
    _enabled = false;
    notifyListeners();
  }
}
