import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puissance_4/common/p4_control.dart';

import '../common/p4_game.dart';
import '../common/p4_grid.dart';
import '../common/p4_control.dart';

import './animated_pion.dart';

class PionManager extends StatefulWidget {
  final double width;
  final double pionDiameter;

  PionManager({
    @required this.width,
    @required this.pionDiameter,
  })  : assert(width != null),
        assert(pionDiameter != null);

  @override
  _PionManagerState createState() => _PionManagerState();
}

class _PionManagerState extends State<PionManager> {
  List<AnimatedPion> _pions = [];

  List<AnimatedPion> buildPions(P4Game game, P4Grid grid, P4Control control) {
    // Try to get the new pion from the engine
    var pion = game.pion;
    if (pion != null && pion.isDroppable) {
      _pions.add(
        AnimatedPion(
          pos: Point(
            pion.column * widget.pionDiameter,
            (grid.cols - 1 - game.pion.row) * widget.pionDiameter,
          ),
          width: widget.pionDiameter,
          image: pion.image,
          animationDuration: 1000 - game.pion.row * 100,
          complete: () {
            game.nextPlayer();
            control.activate();
          },
        ),
      );
    }
    return _pions;
  }

  @override
  Widget build(BuildContext context) {
    final grid = Provider.of<P4Grid>(context);
    final game = Provider.of<P4Game>(context, listen: false);
    final control = Provider.of<P4Control>(context, listen: false);

    return Container(
      width: widget.width,
      height: widget.width,
      child: Stack(
        children: buildPions(game, grid, control),
      ),
    );
  }
}
