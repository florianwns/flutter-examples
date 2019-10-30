import 'package:flutter/material.dart';

import './p4_pion.dart';

class P4Grid {
  final int cols;
  final int rows;

  /// The grid of [P4DroppablePion]
  List<List<P4DroppablePion>> _pions;
  bool get isEmpty => _pions.fold(true, (val, item) => val && item.isEmpty);

  /// The last pion added
  P4DroppablePion _lastPionAdded;
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

  void init() {
    _pions = List<List<P4DroppablePion>>.generate(cols, (_) => []);
    _lastPionAdded = null;
  }

  /// Verify if we can drop a [P4DroppablePion] in this column
  /// Just check if the column is not full
  bool canDrop(int column) {
    return column >= 0 && column < cols && _pions[column].length < rows;
  }

  /// Get the last row available in the column
  int _getLastRowAvailable(int column) {
    return _pions[column].length;
  }

  /// Drop a [P4DroppablePion] of type [type] in a [column]
  void add(int column, P4Pion pion) {
    // verify we can drop a pion in this column
    if (!canDrop(column)) {
      return;
    }

    // Save the last pion added
    _lastPionAdded = P4DroppablePion(
      column: column,
      row: _getLastRowAvailable(column),
      type: pion.type,
    );

    // add pion
    _pions[column].add(_lastPionAdded);
  }

  // Are there lines with at least 4 pions of the same type
  List<P4DroppablePion> getWinningPions() {
    if (_pions.isEmpty ||
        _lastPionAdded == null ||
        _lastPionAdded.column == null ||
        _lastPionAdded.row == null) {
      return [];
    }

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
    for (var direction in directions) {
      // Create on line by direction
      List<P4DroppablePion> line = [];
      for (var incr in direction) {
        final int dx = incr[0], dy = incr[1];
        for (int i = _lastPionAdded.column + dx, j = _lastPionAdded.row + dy;
            i >= 0 &&
                j >= 0 &&
                i < cols &&
                _pions[i].isNotEmpty &&
                j < _pions[i].length;
            i += dx, j += dy) {
          // if the type is different we break the line
          if (_pions[i][j] == null ||
              _pions[i][j].type != _lastPionAdded.type) {
            break;
          }
          // insert at left, add to the right according to the horizontal direction
          (dx < 0) ? line.insert(0, _pions[i][j]) : line.add(_pions[i][j]);
        }
      }

      // if the line have at least 3 pions, we add it to the result
      if (line.length >= 3) {
        linesWithAtLeast4Pions.add(line);
      }
    }

    // If we find a line, we concatenate the lines and add the main pion
    return (linesWithAtLeast4Pions.isNotEmpty)
        ? [
            _lastPionAdded,
            ...linesWithAtLeast4Pions.expand((l) => l),
          ]
        : [];
  }
}
