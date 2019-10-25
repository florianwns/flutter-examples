import 'dart:math';

import 'package:flutter/material.dart';

/// [Pion] class
class Pion extends StatelessWidget {
  final double width;

  final Image image;

  /// Position after animation
  final Point pos;

  /// Constructor
  const Pion({
    @required this.width,
    @required this.image,
    @required this.pos,
  })  : assert(width != null && width > 0),
        assert(image != null),
        assert(pos != null);

  /// Key useful for avoid flickering
  Key get key => ObjectKey(pos);

  /// Build method
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pos.x,
      bottom: pos.y,
      child: Container(
        width: width,
        height: width,
        child: image,
      ),
    );
  }
}
