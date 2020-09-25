import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_game.dart';

import '../widgets/background_image.dart';
import '../widgets/board/game_panel.dart';
import '../widgets/score/score_panel.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background Image
        BackgroundImage(),

        // Game Screen
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => P4Game(cols: 7, rows: 6),
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              title: Text('Puissance 4'),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              // actions: <Widget>[
              //   Icon(Icons.menu),
              // ],
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                ScorePanel(),
                GamePanel(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
