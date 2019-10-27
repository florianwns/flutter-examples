import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_game.dart';
import '../common/p4_control.dart';

import './pion.dart';

class DropFeedback extends StatelessWidget {
  final double width;
  final double pionDiameter;
  final double pionRadius;
  final Color color;

  DropFeedback({
    @required this.width,
    @required this.pionDiameter,    
    @required this.pionRadius,
    @required this.color,
  })  : assert(width != null),
        assert(pionDiameter != null),
        assert(pionRadius != null),
        assert(color != null);

  List<Widget> buildFeedback(P4Game game, P4Control control) {
    List<Widget> children = [];

    if (control.touch != null && game.pion != null) {
      final int column = control.touch.dx ~/ pionDiameter;
      children.add(
        Positioned(
          left: column * pionDiameter,
          top: pionDiameter,
          child: Container(
            width: pionDiameter,
            height: width - pionDiameter,
            color: color,
          ),
        ),
      );

      children.add(
        Pion(
          pos: Point(
            max(0.0, min(width - pionDiameter, control.touch.dx - pionRadius)),
            0.0,
          ),
          width: pionDiameter,
          image: game.pion.image,
        ),
      );
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    final control = Provider.of<P4Control>(context);
    final game = Provider.of<P4Game>(context, listen: false);

    return Container(
      width: width,
      height: width,
      child: Stack(
        children: buildFeedback(game, control),
      ),
    );
  }
}
