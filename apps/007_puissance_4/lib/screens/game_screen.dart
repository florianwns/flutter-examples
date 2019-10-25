import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_theme.dart';
import '../common/p4_engine.dart';
import '../widgets/pion_manager.dart';
import '../widgets/event_manager.dart';

class GameScreen extends StatelessWidget {
  final int cols = 7;
  final int rows = 6;

  /// TODO : Implement a method when there is a winner with a Dialog or something like this
  void theWinnerIs(){
    print('you win');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthRatio = screenWidth / P4Theme.boardImgWidth;
    final gridWidth = cols * P4Theme.pionImgWidth * widthRatio;
    final pionDiameter = gridWidth / cols;

    return Scaffold(
      appBar: AppBar(
        title: Text('Puissance 4'),
      ),
      body: ChangeNotifierProvider<P4Engine>(
        builder: (_) => P4Engine(cols: cols, rows: rows, callback : theWinnerIs),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            // BackBoard
            P4Theme.imgBackboard,

            // Pions
            PionManager(
              width: gridWidth,
              pionDiameter: pionDiameter,
            ),

            // FrontBoard
            P4Theme.imgFrontboard,

            // Game Gesture Detector
            EventManager(
              width: gridWidth,
              pionDiameter: pionDiameter,
            ),
          ],
        ),
      ),
    );
  }
}
