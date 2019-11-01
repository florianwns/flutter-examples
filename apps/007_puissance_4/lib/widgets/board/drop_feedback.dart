import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/p4_game.dart';
import '../../common/p4_control.dart';

import './pion.dart';

/// Drop Feeback widget
/// Display a visual feedback when the user touch the screen
/// Driven by the [P4Control] Provider object.
class DropFeedback extends StatelessWidget {
  final double width;
  final double pionDiameter;
  final double pionRadius;
  final Color color;

  /// Constructor
  DropFeedback({
    @required this.width,
    @required this.pionDiameter,
    @required this.pionRadius,
    @required this.color,
  })  : assert(width != null),
        assert(pionDiameter != null),
        assert(pionRadius != null),
        assert(color != null);

  /// Build feedback from [P4Game] and [P4Control]
  /// Draw a pion and ligth the selected column
  List<Widget> buildFeedback(P4Game game, P4Control control) {
    List<Widget> children = [];
    final currentPion = game.currentPlayerPion;

    // If the game is waiting for order and touch is activated
    if (game.isWaitingForANewPion &&
        control.isValid &&
        control.isEnabled &&
        currentPion != null) {
      // Find the selected column and ligth it
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

      // Draw pion feedback according to the touch position
      children.add(
        Pion(
          pos: Point(
            max(0.0, min(width - pionDiameter, control.touch.dx - pionRadius)),
            0.0,
          ),
          width: pionDiameter,
          image: currentPion.image,
        ),
      );
    }

    return children;
  }

  /// Build method
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
