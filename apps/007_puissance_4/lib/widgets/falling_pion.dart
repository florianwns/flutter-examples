import 'dart:math';

import 'package:flutter/material.dart';

import './pion.dart';

/// [FallingPion] class
class FallingPion extends StatefulWidget {
  final double width;

  /// image
  final Image image;

  /// Horizontal position
  final double left;

  /// Vertical position
  final double top;
  final double bottom;

  /// in milliseconds
  final int animationDuration;

  /// A function to be called when the animation finishes
  final VoidCallback complete;

  /// Constructor
  const FallingPion({
    @required key,
    @required this.width,
    @required this.image,
    @required this.left,
    @required this.top,
    @required this.bottom,
    @required this.animationDuration,
    @required this.complete,
  })  : assert(width != null && width > 0),
        assert(image != null),
        assert(left != null),
        assert(top != null),
        assert(bottom != null),
        assert(animationDuration != null),
        assert(complete != null),
        super(key: key);

  @override
  _FallingPionState createState() => _FallingPionState();
}

class _FallingPionState extends State<FallingPion>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    )
      ..addListener(() => setState(() {}))
      ..addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            widget.complete();
          }
        },
      );

    _animation = Tween<double>(
      begin: widget.top,
      end: widget.bottom,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      ),
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
      pos: Point(widget.left, _animation.value),
      width: widget.width,
      image: widget.image,
    );
  }
}
