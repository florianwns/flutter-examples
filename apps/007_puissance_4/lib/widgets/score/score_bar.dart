import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/p4_game.dart';
import '../../common/p4_theme.dart';
import './score_animation.dart';

class ScoreBar extends StatefulWidget {
  @override
  _ScoreBarState createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int _score;
  Widget _progressBar;

  Widget rebuildProgressBar(int score) {
    final oldScore = _score ?? 0;
    final flexBeginRed = 500 + oldScore * 100;
    final flexBeginYellow = 1000 - flexBeginRed;
    final flexEndRed = 500 + score * 100;
    final flexEndYellow = 1000 - flexEndRed;
    _score = score;

    _progressBar = Row(
      children: <Widget>[
        ScoreAnimation(
          key: UniqueKey(),
          flexBegin: flexBeginRed,
          flexEnd: flexEndRed,
          color: P4Theme.scoreBarRedColor,
        ),
        ScoreAnimation(
          key: UniqueKey(),
          flexBegin: flexBeginYellow,
          flexEnd: flexEndYellow,
          color: P4Theme.scoreBarYellowColor,
        ),
      ],
    );

    return _progressBar;
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<P4Game>(context);
    final score = game.globalScore;
    return (score != _score) ? rebuildProgressBar(score) : _progressBar;
  }
}
