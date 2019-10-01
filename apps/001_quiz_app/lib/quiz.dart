import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Map<String, Object> question;
  final Function callback;

  Quiz({
    @required this.question,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(question['question']),
      ...(question['answers'] as List<Map<String, Object>>).map((answer) {
        return Answer(() => callback(answer['score']), answer['text']);
      }).toList(),
    ]);
  }
}
