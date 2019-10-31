import 'package:flutter/material.dart';

import './p4_pion.dart';

class P4Player {
  final P4Pion pion;

  int _score = 0;
  int get score => _score;
  void won() => _score += 1;

  P4Player({
    @required this.pion,
  }) : assert(pion != null);
}
