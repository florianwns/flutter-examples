import 'package:flutter/material.dart';

class GameButton {
  final id;
  IconData icon;
  Color backgroundColor;
  bool enabled;

  GameButton({
    this.id,
    this.icon,
    this.backgroundColor = Colors.grey,
    this.enabled = true,
  });
}
