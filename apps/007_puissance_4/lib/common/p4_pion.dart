import 'dart:math';

import 'package:flutter/material.dart';

import './p4_theme.dart';

/// [P4Pion] type
enum P4PionType {
  red,
  yellow,
}

/// A droppable [P4Pion] class
class P4DroppablePion extends P4Pion {
  /// Column of the pion  on the grid
  final int column;

  /// Row of the pion on the grid
  final int row;

  /// True if the pion has a column and a row
  bool get isValid => column != null && row != null;
  bool get isNotValid => !isValid;

  /// Constructor
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
  /// Type of this pion
  final P4PionType type;

  /// [Image] of this pion
  Image _image;

  /// Returns the [Image] of the pion
  Image get image => _image;

  /// Constructor
  P4Pion({
    @required this.type,
  }) {
    assert(type != null);
    assert(type == P4PionType.red || type == P4PionType.yellow);
    initImage();
  }

  /// Initialize the image of this pion
  void initImage() {
    switch (type) {
      case P4PionType.red:
        _image =
            P4Theme.redPionImgs[Random().nextInt(P4Theme.redPionImgs.length)];
        break;
      case P4PionType.yellow:
        _image = P4Theme
            .yellowPionImgs[Random().nextInt(P4Theme.yellowPionImgs.length)];
        break;
      default:
        _image = null;
    }
  }

  /// Override the toString method
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
