import 'package:flutter/material.dart';
import './screens/game_screen.dart';

void main() => runApp(Puissance4());

class Puissance4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puissance 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GameScreen(),
      },
    );
  }
}
