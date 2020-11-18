import 'dart:math';

import 'package:flutter/material.dart';
import 'game_button.dart';
import 'custom_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> _buttonList;
  Set _player1Cells;
  Set _player2Cells;
  Set _emptyCells;
  int _activePlayer;
  bool _playAgainstComputer = true;
  int _winner;
  final List<Set> _winningCombinations = const [
    {0, 1, 2},
    {3, 4, 5},
    {6, 7, 8},
    {0, 3, 6},
    {1, 4, 7},
    {2, 5, 8},
    {0, 4, 8},
    {2, 4, 6},
  ];

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    _winner = null;
    _activePlayer = 1;

    _player1Cells = Set();
    _player2Cells = Set();
    _emptyCells = Set.of(List.generate(9, (i) => i));

    _buttonList = _emptyCells.map((index) => GameButton(id: index)).toList();
  }

  void _resetGame() {
    setState(() {
      _initGame();
    });
  }

  void _playGame(GameButton btn) {
    if (_winner != null) return;

    setState(() {
      if (_activePlayer == 1) {
        btn.icon = Icons.zoom_out_map;
        btn.backgroundColor = Colors.purple;
        _activePlayer = 2;
        _player1Cells.add(btn.id);
      } else {
        btn.icon = Icons.album;
        btn.backgroundColor = Colors.teal;
        _activePlayer = 1;
        _player2Cells.add(btn.id);
      }
      btn.enabled = false;
      _emptyCells.remove(btn.id);

      _checkWinner();

      if ([1, 2].contains(_winner)) {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(
            "Player $_winner Won",
            "Press the reset button to start again",
            () {
              if (Navigator.canPop(context)) Navigator.pop(context);
              _resetGame();
            },
          ),
        );
      } else if (_activePlayer == 2 && _playAgainstComputer) {
        _autoplay();
      }
    });
  }

  void _autoplay() {
    if (_emptyCells.length > 0) {
      final int newIndex = Random().nextInt(_emptyCells.length);
      _playGame(_buttonList[_emptyCells.elementAt(newIndex)]);
    }
  }

  void _checkWinner() {
    for (Set combination in _winningCombinations) {
      if (_player1Cells.intersection(combination).length == combination.length) {
        _winner = 1;
        break;
      }
      if (_player2Cells.intersection(combination).length == combination.length) {
        _winner = 2;
        break;
      }
    }
  }

  void _toggleAutoplay() {
    setState(() {
      _playAgainstComputer = !_playAgainstComputer;
      if (_activePlayer == 2 && _playAgainstComputer) {
        _autoplay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              padding: const EdgeInsets.all(10.0),
              itemCount: _buttonList.length,
              itemBuilder: (context, index) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: _buttonList[index].enabled
                      ? () => _playGame(_buttonList[index])
                      : null,
                  child: Icon(
                    _buttonList[index].icon,
                    size: 50,
                    color: Colors.white,
                  ),
                  color: _buttonList[index].backgroundColor,
                  disabledColor: _buttonList[index].backgroundColor,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Reset",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Icon(
                        Icons.sync,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  color: Colors.purple,
                  padding: const EdgeInsets.all(20.0),
                  onPressed: _resetGame,
                ),
              ),
              RaisedButton(
                child: Icon(
                  Icons.computer,
                  color: Colors.white,
                  size: 30,
                ),
                color: _playAgainstComputer ? Colors.purple : Colors.grey,
                padding: const EdgeInsets.all(20.0),
                onPressed: _toggleAutoplay,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
