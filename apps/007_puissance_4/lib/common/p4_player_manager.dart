import 'p4_pion.dart';
import 'p4_player.dart';

/// A player manager for the game engine
class P4PlayerManager {
  /// List of 2 Players
  final List<P4Player> _players = [
    P4Player(
      pion: P4Pion(type: P4PionType.red),
    ),
    P4Player(
      pion: P4Pion(type: P4PionType.yellow),
    ),
  ];

  /// Keep track of who to start the game
  int _startIndex = 0;

  /// Index of the current player
  int _currentIndex = 0;

  /// Pass to the next player
  void next() {
    _currentIndex = (_currentIndex + 1) % _players.length;
  }

  /// Start the game with another player
  void startWithAnOtherPlayer() {
    _startIndex = (_startIndex + 1) % _players.length;
    _currentIndex = 0;
  }

  /// Get the current player
  P4Player get current {
    return _players[_currentIndex];
  }

  /// Returns an [P4Player] according to the index 
  P4Player operator [](int index) {
    assert(_players.length > 0);
    assert(index >= 0 && index < _players.length);
    return _players[index];
  }
}
