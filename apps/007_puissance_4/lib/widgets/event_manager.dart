import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_engine.dart';

class EventManager extends StatefulWidget {
  final double width;
  final double pionDiameter;

  EventManager({
    @required this.width,
    @required this.pionDiameter,
  })  : assert(width != null),
        assert(pionDiameter != null);

  @override
  _EventManagerState createState() => _EventManagerState();
}

class _EventManagerState extends State<EventManager> {
  int _columnIndex;

  void onTouch(P4Engine game, Offset pos) {
    assert(pos != null);

    // Don't drop a pion when user leave the grid
    if (pos.dx < 0 || pos.dx >= widget.width || pos.dy < 0 || pos.dy >= widget.width) {
      _columnIndex = null;
      return;
    }
    else {
      _columnIndex = pos.dx ~/ widget.pionDiameter;
    }
  }

  void onRelease(P4Engine game) {
    if(_columnIndex != null){
     game.addPion(_columnIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build gesture detector');
    final game = Provider.of<P4Engine>(context, listen: false);

    return GestureDetector(
      onTapDown: (TapDownDetails d) => onTouch(game, d.localPosition),
      onTapUp: (_) => onRelease(game),
      onHorizontalDragStart: (DragStartDetails d) =>
          onTouch(game, d.localPosition),
      onHorizontalDragUpdate: (DragUpdateDetails d) =>
          onTouch(game, d.localPosition),
      onHorizontalDragEnd: (_) => onRelease(game),
      child: Container(
        width: widget.width,
        height: widget.width,
        // Add color for capture event
        color: Colors.transparent,
      ),
    );
  }
}
