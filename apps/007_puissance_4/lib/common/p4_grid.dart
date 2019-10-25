
import 'package:meta/meta.dart';

import './p4_pion.dart';

class P4Grid{
  final int cols;
  
  final int rows;

  /// The grid of [P4PionType]
  List<List<P4Pion>> _grid;

   /// Constructor
  P4Grid({
    @required this.cols,
    @required this.rows,
  }) {
    _grid = List<List<P4Pion>>.generate(cols, (_) => []);    
  }

  /// Verify if we can drop a [P4Pion] in this column
  /// Just check if the column is not full
  bool canDrop(int column) {
    return column >= 0 &&
        column < cols &&
        _grid[column].length < rows;
  } 

  /// Drop a [P4Pion] in a column
  void add(int column, P4Pion pion) {
    // verify we can drop a pion in this column
    if(!canDrop(column)){
      return;
    }

    // add [Pion]
    _grid[column].add(pion);
  }

  get items{
    return List.from(_grid, growable: false);
  } 
}