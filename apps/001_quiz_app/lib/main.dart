import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _score = 0;
  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 4},
        {'text': 'Blue', 'score': 2},
        {'text': 'Purple', 'score': 6},
      ],
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Lion', 'score': 2},
        {'text': 'Eagle', 'score': 1},
        {'text': 'Butterfly', 'score': 3},
      ]
    },
    {
      'question': 'What\'s your best friend?',
      'answers': [
        {'text': 'Doudou', 'score': 4},
        {'text': 'Youg', 'score': 2},
        {'text': 'Guïom', 'score': 1},
        {'text': 'Bruno', 'score': 5},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
    });
  }

  void _nextQuestion(int score) {
    _score += score;

    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                callback: _nextQuestion,
                question: _questions[_questionIndex],
              )
            : Result(
                callback: _resetQuiz,
                score: _score,
              ),
      ),
    );
  }
}
