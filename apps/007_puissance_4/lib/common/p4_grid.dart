import 'package:flutter/material.dart';

import './p4_pion.dart';

/// Grid of the game
class P4Grid {
  /// Number of columns
  final int cols;

  /// Number of rows
  final int rows;

  /// Grid of [P4DroppablePion]
  List<List<P4DroppablePion>> _grid;

  /// True if this grid [_grid] is empty
  bool get isEmpty => _grid.fold(true, (val, item) => val && item.isEmpty);

  /// The last pion added in this grid
  P4DroppablePion _lastPionAdded;

  /// Returns the last pion added in the grid
  P4DroppablePion get lastPionAdded => _lastPionAdded;

  /// Constructor
  P4Grid({
    @required this.cols,
    @required this.rows,
  }) {
    assert(cols != null && cols >= 7);
    assert(rows != null && rows >= 6);
    init();
  }

  /// Initialize the grid,
  /// and set the last pion added to null
  void init() {
    _grid = List<List<P4DroppablePion>>.generate(cols, (_) => []);
    _lastPionAdded = null;
  }

  /// Verify if we can drop a pion in this column
  /// Just check if the column is not full
  bool canDrop(int column) {
    return column >= 0 && column < cols && _grid[column].length < rows;
  }

  /// Get the last row available in the column
  int _getLastRowAvailable(int column) {
    return _grid[column].length;
  }

  /// Returns True if it's possible to drop a [pion] in the [column] of the grid
  /// False otherwise
  /// 
  /// Drop a [P4DroppablePion] of type [type] in a [column]
  bool tryToAddPion(int column, P4Pion pion) {
    // Verify that we can drop a pion in this column
    if (!canDrop(column)) {
      // Returns false, if we can't drop the pion
      return false;
    }

    // Save the last pion added and make the pion droppable
    _lastPionAdded = P4DroppablePion(
      column: column,
      row: _getLastRowAvailable(column),
      type: pion.type,
    );

    // Add pion to the grid
    _grid[column].add(_lastPionAdded);

    // Returns true if the pion has been added
    return true;
  }

  /// Return a [List] of [P4DroppablePion]
  ///
  /// Are there horizontal, diagonal, or vertical lines
  /// with at least 4 joint pions of the same type ?
  List<P4DroppablePion> getWinningPions() {
    // Returns an empty list,
    // if the grid is empty or the last pion is not valid
    if (_grid.isEmpty || _lastPionAdded == null || _lastPionAdded.isNotValid) {
      return [];
    }

    // Set the 4 directions
    final List<List<List<int>>> directions = const [
      [
        [0, -1], // ↓
      ],
      [
        [-1, 0], // ←
        [1, 0], // →
      ],
      [
        [-1, -1], // ↙
        [1, 1], // ↗
      ],
      [
        [-1, 1], // ↖
        [1, -1] // ↘
      ],
    ];

    var linesWithAtLeast4Pions = [];

    // Try to find a line in each direction with at least 4 joint pions
    for (var direction in directions) {
      List<P4DroppablePion> line = [];
      for (var incr in direction) {
        final int dx = incr[0], dy = incr[1];
        for (int i = _lastPionAdded.column + dx, j = _lastPionAdded.row + dy;
            i >= 0 &&
                j >= 0 &&
                i < cols &&
                _grid[i].isNotEmpty &&
                j < _grid[i].length;
            i += dx, j += dy) {
          // if the type is different we break the line
          if (_grid[i][j] == null || _grid[i][j].type != _lastPionAdded.type) {
            break;
          }
          // Insert at left, add to the right according to the horizontal direction
          (dx < 0) ? line.insert(0, _grid[i][j]) : line.add(_grid[i][j]);
        }
      }

      // If the line have at least 3 pions, we add it to the result
      if (line.length >= 3) {
        linesWithAtLeast4Pions.add(line);
      }
    }

    // If we find at least one line with 3 pions (4 with the main pion),
    // we concatenate the lines and add the main pion
    return (linesWithAtLeast4Pions.isNotEmpty)
        ? [
            _lastPionAdded,
            ...linesWithAtLeast4Pions.expand((l) => l),
          ]
        : [];
  }
}
