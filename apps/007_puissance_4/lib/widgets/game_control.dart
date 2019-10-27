import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_game.dart';
import '../common/p4_grid.dart';
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
  /// update the column index
  void onTouch(P4Control control, Offset pos) {
    control.update(pos, widget.width);
  }

  void onRelease(P4Game game, P4Grid grid, P4Control control) {
    if(control.touch != null){
      final int column = control.touch.dx ~/ widget.pionDiameter;
      grid.add(column, game.pion);
    }
    control.release();
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<P4Game>(context, listen: false);
    final grid = Provider.of<P4Grid>(context, listen: false);
    final control = Provider.of<P4Control>(context, listen: false);    

    return GestureDetector(
      onTapDown: (TapDownDetails d) => onTouch(control, d.localPosition),
      onTapUp: (_) => onRelease(game, grid, control),
      onHorizontalDragStart: (DragStartDetails d) =>
          onTouch(control, d.localPosition),
      onHorizontalDragUpdate: (DragUpdateDetails d) => onTouch(control,d.localPosition),
      onHorizontalDragEnd: (_) => onRelease(game, grid, control),
      child: Container(
        width: widget.width,
        height: widget.width,
        // Add color for capture event
        color: Colors.transparent,
      ),
    );
  }
}
