import 'p4_pion.dart';
import 'p4_player.dart';

/// List of [P4Player]
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

  void next() {
    _currentIndex = (_currentIndex + 1) % _players.length;
  }

  void startWithAnOtherPlayer() {
    _startIndex = (_startIndex + 1) % _players.length;
    _currentIndex = 0;
  }

  /// Get the current player
  P4Player get current {
    return _players[_currentIndex];
  }
}
