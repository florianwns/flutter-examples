import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puissance_4/common/p4_grid.dart';

import '../common/p4_theme.dart';
import '../common/p4_game.dart';
import '../common/p4_grid.dart';
import '../common/p4_control.dart';

import '../widgets/pion_manager.dart';
import '../widgets/game_control.dart';
import '../widgets/drop_feedback.dart';

class GameScreen extends StatelessWidget {
  final int cols = 7;
  final int rows = 6;

  /// TODO : Implement a method when there is a winner with a Dialog or something like this
  void theWinnerIs() {
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthRatio = screenWidth / P4Theme.boardImgWidth;
    final gridWidth = cols * P4Theme.pionImgWidth * widthRatio;
    final pionDiameter = gridWidth / cols;
    final pionRadius = pionDiameter / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Puissance 4'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => P4Game(callback: theWinnerIs)),
          ChangeNotifierProvider(
              builder: (_) => P4Grid(cols: cols, rows: rows)),
          ChangeNotifierProvider(builder: (_) => P4Control()),

          //ChangeNotifierProvider(builder: (_) => Customer()),
        ],
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            // BackBoard
            P4Theme.imgBackboard,

            DropFeedback(
              width: gridWidth,
              pionDiameter: pionDiameter,
              pionRadius: pionRadius,
              color: P4Theme.dropColor,
            ),

            // Pions Manager <= P4Game
            PionManager(
              width: gridWidth,
              pionDiameter: pionDiameter,
            ),

            // FrontBoard
            P4Theme.imgFrontboard,

            // Game Gesture Detector => P4Engine
            GameControl(
              width: gridWidth,
              pionDiameter: pionDiameter,
            ),
          ],
        ),
      ),
    );
  }
}
