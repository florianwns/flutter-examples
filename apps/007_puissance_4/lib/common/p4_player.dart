import 'package:flutter/material.dart';

import './p4_pion.dart';

/// A player of the game
class P4Player {
  /// A playable pion
  final P4Pion pion;

  /// Score
  int _score = 0;

  /// Returns the score of this player
  int get score => _score;

  /// When this player won, increment his score
  void won() => _score += 1;

  /// Constructor
  P4Player({
    @required this.pion,
  }) : assert(pion != null);
}
