import 'package:flutter/material.dart';

import './p4_pion.dart';
import './p4_player.dart';
import './p4_player_manager.dart';

/// A [P4Game] engine with a [P4Pion] grid
/// By default the game grid size is 7 x 6
class P4Game extends ChangeNotifier {
  // TODO : Implements the A.I. and game rules 
  // TODO : Block the game until A.I. finish

  /// Player manager
  P4PlayerManager _players;

  /// Current Pion
  P4Pion _pion;

  /// Constructor
  P4Game() {
    initGame();
  }

  void initGame() {
    _players = P4PlayerManager(
      [
        P4Player(P4PionType.red),
        P4Player(P4PionType.yellow),
      ],
    );

    newPion();
  }

  void newPion() {
    _pion = _players.current.takeAPion();
  }

  void nextPlayer() {
    // pass to the next player
    _players.next();
    newPion();
  }

  get pion {
    return _pion;
  }
}
