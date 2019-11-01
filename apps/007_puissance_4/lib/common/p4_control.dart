import 'package:flutter/material.dart';

/// A control provider that is used by many widgets
/// 
/// Helps better manage touch events by enabling or disabling this control.
class P4Control extends ChangeNotifier {
  /// The enable state of this control
  bool _enabled = true;

  /// True if this control is enabled
  bool get isEnabled => _enabled;

  /// True if this control is not enabled
  bool get isNotEnabled => !isEnabled;

  /// Set [_enabled] to true
  /// Then notify the provider listeners
  void activate() {
    _enabled = true;
    notifyListeners();
  }

  /// Set [_enabled] to false
  /// Then notify the provider listeners
  void deactivates() {
    _enabled = false;
    notifyListeners();
  }

  /// The last touch position
  Offset _touch;

  /// Returns the last touch position
  Offset get touch => _touch;

  /// Set the last touch position with [touch]
  /// Then notify the provider listeners
  set touch(Offset touch) {
    _touch = touch;
    if (isEnabled) {
      notifyListeners();
    }
  }

  /// Release the touch, set it to null
  void release() => _touch = null;

  /// True if the touch is not null
  bool get isValid => _touch != null;

  /// True if the touch is null
  bool get isNotValid => _touch == null;
}
