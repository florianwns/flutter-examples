import 'package:flutter/material.dart';

import './p4_theme.dart';

/// [P4Pion] type
enum P4PionType {
  red,
  yellow,
  length,
}

/// [P4Pion] class
class P4Pion {
  final P4PionType type;

  const P4Pion({
    @required this.type,
  });

  /// Color getter
  Color get color {
    switch (type) {
      case P4PionType.red:
        return Colors.red;
      case P4PionType.yellow:
        return Colors.yellow;
      default:
        return null;
    }
  }

  /// Color getter
  Image get image {
    switch (type) {
      case P4PionType.red:
        return P4Theme.imgsPionRed[0];
      case P4PionType.yellow:
        return P4Theme.imgsPionJaune[0];
      default:
        return null;
    }
  }
}
