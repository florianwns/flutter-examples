import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/p4_game.dart';
import '../common/p4_pion.dart';

class WinningPions extends StatelessWidget {
  final double width;
  final double pionDiameter;
  final Color color;

  WinningPions({
    @required this.width,
    @required this.pionDiameter,
    @required this.color,
  })  : assert(width != null),
        assert(pionDiameter != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<P4Game>(context);
    
    return CustomPaint(
      painter: LinesPainter(
        pions: game.winningPions,
        pionDiameter: pionDiameter,
      ),
      child: Container(
        width: width,
        height: width,
      ),
    );
  }
}

class LinesPainter extends CustomPainter {
  final List<P4DroppablePion> pions;
  final double pionDiameter;

  LinesPainter({
    @required this.pions,
    @required this.pionDiameter,
  })  : assert(pions != null),
        assert(pionDiameter != null);

  @override
  void paint(Canvas canvas, Size size) {
    if(pions.isEmpty) return;

    final paint = Paint()
      ..color = Colors.white38
      ..style = PaintingStyle.stroke
      ..strokeWidth = pionDiameter * 0.05;
    final radius = pionDiameter / 2;

    for (var pion in pions) {
      canvas.drawCircle(
          Offset(
            pion.column * pionDiameter + radius,
            size.width - pion.row * pionDiameter - radius,
          ),
          radius * 0.9,
          paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) => false;
}
