import 'dart:math';

import 'package:flutter/material.dart';

class Pion extends StatelessWidget {
  final double width;
  final Image image;
  final Point pos;

  /// Constructor
  const Pion({
    @required this.width,
    @required this.image,
    @required this.pos,
  })  : assert(width != null && width > 0),
        assert(image != null),
        assert(pos != null);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pos.x,
      top: pos.y,
      child: Container(
        width: width,
        height: width,
        child: image,
      ),
    );
  }
}

