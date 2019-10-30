import 'dart:math';

import 'package:flutter/material.dart';

import './p4_theme.dart';

/// [P4Pion] type
enum P4PionType {
  red,
  yellow,
  length,
}

/// A droppable [P4Pion] class
class P4DroppablePion extends P4Pion {
  final int column;
  final int row;

  P4DroppablePion({
    @required type,
    @required this.column,
    @required this.row,
  })  : assert(column != null),
        assert(row != null),
        super(type: type);
}

/// [P4Pion] class
class P4Pion {
  final P4PionType type;

  Image _image;
  Image get image => _image;

  P4Pion({
    @required this.type,
  }) {
    assert(type != null);
    assert(type == P4PionType.red || type == P4PionType.yellow);
    initImage();
  }

  /// Color getter
  void initImage() {
    switch (type) {
      case P4PionType.red:
        _image =
            P4Theme.imgsPionRed[Random().nextInt(P4Theme.imgsPionRed.length)];
        break;
      case P4PionType.yellow:
        _image = P4Theme
            .imgsPionJaune[Random().nextInt(P4Theme.imgsPionJaune.length)];
        break;
      default:
        _image = null;
    }
  }

  @override
  String toString() {
    switch (type) {
      case P4PionType.red:
        return 'x';
      case P4PionType.yellow:
        return '0';
      default:
        return ' ';
    }
  }
}
