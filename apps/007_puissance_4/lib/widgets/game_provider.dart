import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_theme.dart';
import '../common/p4_grid.dart';
import '../common/p4_control.dart';

import './pion_manager.dart';
import './game_control.dart';
import './drop_feedback.dart';

class GameProvider extends StatelessWidget {
  final int cols = 7;
  final int rows = 6;

  List<SingleChildCloneableWidget> buildProviders(BuildContext context) {
    return [
      ChangeNotifierProvider(
        builder: (_) => P4Grid(
          cols: cols,
          rows: rows,
        ),
      ),
      ChangeNotifierProvider(
        builder: (_) => P4Control(),
      ),
    ];
  }

  Widget buildStack(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthRatio = screenWidth / P4Theme.boardImgWidth;
    final gridWidth = cols * P4Theme.pionImgWidth * widthRatio;
    final pionDiameter = gridWidth / cols;
    final pionRadius = pionDiameter / 2;

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        // BackBoard
        P4Theme.imgBackboard,

        // Drop Visual Feedback
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: buildProviders(context),
      child: buildStack(context),
    );
  }
}
