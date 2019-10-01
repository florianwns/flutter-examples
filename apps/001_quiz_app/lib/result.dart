import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function callback;

  Result({
    @required this.score,
    @required this.callback,
  });

  String get _resultText {
    var text = 'You did it!';
    if (score >= 12) {
      text = 'You are AWESOME !';
    } else if (score < 8) {
      text = 'You are so BAD !';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            _resultText,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          FlatButton(
            child: Text(
              'Restart Quiz!',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: callback,
          ),
        ],
      ),
    );
  }
}
