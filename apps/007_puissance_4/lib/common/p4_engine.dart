import 'package:flutter/material.dart';

import '../widgets/pion.dart';
import './p4_grid.dart';
import './p4_pion.dart';
import './p4_player.dart';
import './p4_player_manager.dart';

/// A [P4Engine] width a [Pion] grid
/// By default the game grid is 7 x 6
class P4Engine extends ChangeNotifier {

  final Function callback;

  /// The grid of [P4Pion]
  P4Grid _grid;

  /// Player manager
  P4PlayerManager _players;

  /// Constructor
  P4Engine({
    @required cols,
    @required rows,
    @required this.callback,
  }) {
    assert(cols >= 7 && rows >= 6);

    _players = P4PlayerManager(
      [
        P4Player(P4PionType.red),
        P4Player(P4PionType.yellow),
      ],
    );

    _grid = P4Grid(
      cols: cols,
      rows: rows,
    );
  }

  /// Verify if the player can drop a [P4Pion] in the column
  bool canDrop(int column) {
    return _grid.canDrop(column);
  }

  /// Drop a [P4Pion] in the [column]
  void addPion(int column) {
    // Verify if the pion is droppable
    if (!canDrop(column)) {
      return;
    }
    // Create a new [P4Pion] and add it to the [P4Grid]
    var pion = P4Pion(type: _players.current.pionType);
    _grid.add(column, pion);

    // Pass to the next player
    _players.next();

    // TODO : Analyse the game and callback if there is a winner
    callback();

    // Notify all listerners that data changed
    notifyListeners();
  }

 get pions{
    return _grid.items;
  }
}
