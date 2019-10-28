import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_game.dart';

import '../widgets/background_image.dart';
import '../widgets/game_provider.dart';

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
              builder: (_) => P4Game(),
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              title: Text('À vous de jouer'),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                Icon(Icons.menu),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                GameProvider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
