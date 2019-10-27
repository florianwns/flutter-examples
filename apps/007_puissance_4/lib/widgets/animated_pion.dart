import 'dart:math';

import 'package:flutter/material.dart';

import './pion.dart';

/// [AnimatedPion] class
class AnimatedPion extends StatefulWidget {
  final double width;

  /// image
  final Image image;

  /// Position after animation
  final Point pos;

  /// in milliseconds
  final int animationDuration;

  /// Constructor
  const AnimatedPion({
    @required this.width,
    @required this.image,
    @required this.pos,
    @required this.animationDuration,
  })  : assert(width != null && width > 0),
        assert(image != null),
        assert(pos != null),
        assert(animationDuration != null);

  @override
  _AnimatedPionState createState() => _AnimatedPionState();
}

class _AnimatedPionState extends State<AnimatedPion>
    with SingleTickerProviderStateMixin {
  /// Key useful for avoid flickering
  Key get key => ObjectKey(widget.pos);

  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.animationDuration))
      ..addListener(() => setState(() {}));

    _animation = Tween<double>(begin: 0.0, end: widget.pos.y).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.bounceOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Build method
  @override
  Widget build(BuildContext context) {
    return Pion(
      pos: Point(widget.pos.x, _animation.value),
      width: widget.width,
      image: widget.image,
    );
  }
}
