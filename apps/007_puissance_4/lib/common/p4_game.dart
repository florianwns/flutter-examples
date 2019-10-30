import 'package:flutter/material.dart';
import 'package:puissance_4/common/p4_grid.dart';

import './p4_pion.dart';
import './p4_player_manager.dart';

enum P4GameState {
  waitingForANewPion,
  over,
  newPionToDrop,
}

/// A [P4Game] engine with a [P4Pion] grid
/// By default the game grid size is 7 x 6
class P4Game extends ChangeNotifier {
  /// Player manager
  final P4PlayerManager _players = P4PlayerManager();

  /// Game grid
  P4Grid _grid;
  int get cols => _grid.cols;
  int get rows => _grid.rows;
  P4DroppablePion get lastPionAdded => _grid.lastPionAdded;

  /// Current Pion
  P4Pion get currentPion => _players.current.pion;
  List<P4DroppablePion> _winningPions;
  List<P4DroppablePion> get winningPions => _winningPions;

  /// State of the Game
  P4GameState _state;
  bool get isWaitingForANewPion => _state == P4GameState.waitingForANewPion;
  bool get isOver => _state == P4GameState.over;
  bool get hasANewPionToDrop => _state == P4GameState.newPionToDrop;
  bool get isNew => isWaitingForANewPion && _grid.isEmpty;

  /// Constructor
  P4Game({
    @required cols,
    @required rows,
  }) {
    _grid = P4Grid(cols: cols, rows: rows);
    _winningPions = [];
    _state = P4GameState.waitingForANewPion;
  }

  /// Pass to the next player
  void nextPlayer() {
    _state = P4GameState.waitingForANewPion;
    _players.next();
  }

  /// End of game => notify listeners
  void endOfGame() {
    _state = P4GameState.over;
    _players.current.won(); // score += 1
    notifyListeners();    
  }

  void checkIfThereIsAwinner(){
    _winningPions = _grid.getWinningPions();
    (_winningPions.length >= 4)
      ? endOfGame()
      : nextPlayer();
  }
  
  /// Add a new [P4Pion] in a [column] => notify listeners
  void addANewPionInAColumn(int column) {
    _state = P4GameState.newPionToDrop;
    _grid.add(column, currentPion);
    notifyListeners();
  }

  /// Play a new Game => notify
  void playNewGame() {
    _state = P4GameState.waitingForANewPion;
    _grid.init();
    _winningPions = [];
    _players.startWithAnOtherPlayer();
    notifyListeners();
  }
}
