import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puissance_4/common/p4_pion.dart';

import '../../common/p4_game.dart';
import '../../common/p4_control.dart';

import './falling_pion.dart';

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
  /// List of [FallingPion]
  List<FallingPion> _pions = [];

  void dropPion(P4Game game, P4DroppablePion pion, P4Control control) {
    assert(pion != null && game != null);

    _pions.add(
      FallingPion(
        key: UniqueKey(),
        left: pion.column * widget.pionDiameter,
        top: 0.0,
        bottom: (game.cols - 1 - pion.row) * widget.pionDiameter,
        width: widget.pionDiameter,
        image: pion.image,
        animationDuration: 1000 - pion.row * 100,
        complete: () {
          // Unblock touch control after animation
          control.activate();

          // Check if there is a winner
          game.checkIfThereIsAwinner();
        },
      ),
    );
  }

  void pionsMustFall(P4Game game, P4Control control) {
    assert(game != null);
    final delay = 3000;
    // Unblock touch control
    List<FallingPion> pions = [];
    for (var pion in _pions) {
      int animationDuration = delay - ((pion.bottom / widget.width) * delay ~/ 2);
      pions.add(
        FallingPion(
          key: UniqueKey(),
          left: pion.left,
          top: pion.bottom,
          bottom: pion.bottom + widget.width,
          width: pion.width,
          image: pion.image,
          animationDuration: animationDuration,
          complete: () {},
        ),
      );
    }
    _pions = pions;

    // delay the update control and clean the pions backup
    Future.delayed(
      Duration(milliseconds: delay),
      () {
        _pions = [];
        control.activate();
      },
    );
  }

  List<FallingPion> buildPions(P4Game game, P4Control control) {
    // it the game has a new pion to drop
    if (game.hasANewPionToDrop) {
      // we take it and we drop it
      final lastPionToDrop = game.lastPionAdded;
      if (lastPionToDrop != null) {
        dropPion(game, lastPionToDrop, control);
      }
    } else if (game.isNew && _pions.isNotEmpty) {
      pionsMustFall(game, control);
    }

    return _pions;
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<P4Game>(context);
    final control = Provider.of<P4Control>(context, listen: false);

    return Container(
      width: widget.width,
      height: widget.width,
      child: Stack(
        children: buildPions(game, control),
      ),
    );
  }
}
