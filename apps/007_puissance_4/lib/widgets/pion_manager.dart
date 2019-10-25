import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_engine.dart';
import './pion.dart';

class PionManager extends StatelessWidget {
  final double width;
  final double pionDiameter;

  PionManager({
    @required this.width,
    @required this.pionDiameter,
  })  : assert(width != null),
        assert(pionDiameter != null);

  List<Pion> buildPions(P4Engine game) {
    List<Pion> children = [];
    final pions = game.pions;

    for (int i = 0; i < pions.length; i++) {
      for (int j = 0; j < pions[i].length; j++) {
        children.add(
          Pion(
            pos: Point(
              i * pionDiameter,
              j * pionDiameter,
            ),
            width: pionDiameter,
            image: pions[i][j].image,
          ),
        );
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<P4Engine>(context);

    return Container(
      width: width,
      height: width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: buildPions(game),
      ),
    );
  }
}
