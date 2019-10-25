import 'p4_player.dart';

/// List of [P4Player]
class P4PlayerManager{
  /// List of Players
  List<P4Player> _players = [];

  /// Index of the current player
  int _currentIndex = 0;

  /// Constructor
  P4PlayerManager(this._players) : assert(_players != null || _players.isEmpty);

  void next(){
    _currentIndex = (_currentIndex + 1) % _players.length;
  }

  /// Get the current player
  P4Player get current{
    return _players[_currentIndex];
  }
}