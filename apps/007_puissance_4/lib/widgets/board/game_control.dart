import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/p4_game.dart';
import '../../common/p4_control.dart';

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
    // Don't drop a pion when user leave the grid
    control.touch = (pos.dx < 0 ||
            pos.dx >= widget.width ||
            pos.dy < 0 ||
            pos.dy >= widget.width)
        ? null
        : pos;
  }

  /// Handler on the release event
  void onRelease(P4Game game, P4Control control) {
    if(control.isNotValid || control.isNotEnabled){
      control.release();
      return;
    }
    
    // If control is valid and active => actions
    if (game.isWaitingForANewPion) {
      // We add a new pion
      final int column = control.touch.dx ~/ widget.pionDiameter;
      game.addANewPionInAColumn(column);
    } else if (game.isOver) {
      // Block control until the end of the animation
      // If the game is finished, we play a new game
      game.playNewGame();
    }

    // Relase touch and block control until the end of the animation
    control.release();
    control.deactivates();
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
