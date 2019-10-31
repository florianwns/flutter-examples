import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_game.dart';
import '../common/p4_control.dart';

class GameControl extends StatefulWidget {
  final double width;
  final double pionDiameter;

  GameControl({
    @required this.width,
    @required this.pionDiameter,
  })  : assert(width != null),
        assert(pionDiameter != null);

  @override
  _GameControlState createState() => _GameControlState();
}

class _GameControlState extends State<GameControl> {
  /// Handler on the touch event
  void onTouch(P4Game game, P4Control control, Offset pos) {
    control.update(pos, widget.width);
  }

  /// Handler on the release event
  void onRelease(P4Game game, P4Control control) {
    if (control.isValid && control.isEnabled) {
      if (game.isWaitingForANewPion) {
        // We add a new pion
        final int column = control.touch.dx ~/ widget.pionDiameter;
        game.addANewPionInAColumn(column);
      } else if (game.isOver) {
        // Block control until the end of the animation
        // If the game is finished, we play a new game
        game.playNewGame();
      }

      // Block control until the end of the animation
      control.block();
    }
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<P4Game>(context, listen: false);
    final control = Provider.of<P4Control>(context, listen: false);

    return GestureDetector(
      onTapDown: (TapDownDetails d) => onTouch(game, control, d.localPosition),
      onTapUp: (_) => onRelease(game, control),
      onHorizontalDragStart: (DragStartDetails d) =>
          onTouch(game, control, d.localPosition),
      onHorizontalDragUpdate: (DragUpdateDetails d) =>
          onTouch(game, control, d.localPosition),
      onHorizontalDragEnd: (_) => onRelease(game, control),
      child: Container(
        width: widget.width,
        height: widget.width,
        // Add color for capture event
        color: Colors.transparent,
      ),
    );
  }
}
