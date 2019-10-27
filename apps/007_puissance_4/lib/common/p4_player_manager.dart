import 'p4_player.dart';

/// List of [P4Player]
class P4PlayerManager{
  /// List of Players
  List<P4Player> _players = [];

  /// Index of the current player
  int _index = 0;

  /// Constructor
  P4PlayerManager(this._players) : assert(_players != null || _players.isEmpty);

  void next(){
    _index = (_index + 1) % _players.length;
  }

  /// Get the current player
  P4Player get current{
    return _players[_index];
  }
}