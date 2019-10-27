import './p4_pion.dart';

class P4Player {
  final P4PionType pionType;

  int score = 0;

  P4Player(this.pionType);

  P4Pion takeAPion() {
    return P4Pion(type: pionType);
  }
}
