import 'package:flutter/material.dart';
import 'package:puissance_4/common/p4_grid.dart';

import './p4_pion.dart';
import './p4_player_manager.dart';

/// State of the game
enum P4GameState {
  waitingForANewPion,
  over,
  newPionToDrop,
}

/// A [P4Game] game engine
/// 
/// By default the 'Puissance 4' game is a grid of 7 x 6
/// The game engine is a provider.
class P4Game extends ChangeNotifier {
  /// A player manager which allows to manage the 2 players
  final P4PlayerManager _players = P4PlayerManager();
  
  /// Returns the global score of the game
  /// 
  /// Global score is the Red Player score less Yellow Player Score
  int get globalScore => _players[0].score - _players[1].score;

  /// The game grid
  P4Grid _grid;

  /// Number of columns in the grid
  int get cols => _grid.cols;

  /// Number of rows in the grid
  int get rows => _grid.rows;

  /// Returns the last pion added in the grid
  P4DroppablePion get lastPionAdded => _grid.lastPionAdded;

  /// Returns the current player's pion
  P4Pion get currentPlayerPion => _players.current.pion;

  /// Winning pions from the game grid
  List<P4DroppablePion> _winningPions;

  /// Returns Winning pions from the game grid
  List<P4DroppablePion> get winningPions => _winningPions;

  /// State of the Game
  P4GameState _state;

  /// True if the game is waiting for a new pion
  bool get isWaitingForANewPion => _state == P4GameState.waitingForANewPion;

  /// True if the game is over
  bool get isOver => _state == P4GameState.over;

  /// True if the game has a new pion to drop
  bool get hasANewPionToDrop => _state == P4GameState.newPionToDrop;

  /// True if this is a new game
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

  /// End of game 
  /// Then notify the provider listeners
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
  
  /// Returns True if the column of the grid has place to drop a pion
  /// False otherwise
  /// 
  /// Add a new [P4Pion] in a [column] of the grid
  /// Then notify the provider listeners if the pion has been added
  bool tryToAddANewPionInAColumn(int column) {
    final bool pionIsAdded = _grid.tryToAddPion(column, currentPlayerPion);
    if(pionIsAdded){
      _state = P4GameState.newPionToDrop;
      notifyListeners();
    }
    return pionIsAdded;
  }

  /// Play a new Game
  /// Then notify the provider listeners
  void playNewGame() {
    _state = P4GameState.waitingForANewPion;
    _grid.init();
    _winningPions = [];
    _players.startWithAnOtherPlayer();
    notifyListeners();
  }
}
