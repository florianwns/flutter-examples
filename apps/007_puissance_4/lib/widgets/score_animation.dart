import 'package:flutter/material.dart';

class ScoreAnimation extends StatefulWidget {
  final int flexBegin;
  final int flexEnd;
  final Color color;

  ScoreAnimation({
    @required key,
    @required this.flexBegin,
    @required this.flexEnd,
    @required this.color,
  })  : assert(flexBegin != null),
        assert(flexEnd != null),
        assert(color != null),
        super(key: key);

  @override
  _ScoreAnimationState createState() => _ScoreAnimationState();
}

class _ScoreAnimationState extends State<ScoreAnimation>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(
        () => setState(() {}),
      );

    _animation = IntTween(
      begin: widget.flexBegin,
      end: widget.flexEnd,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
        ),
      ),
      flex: _animation.value,
    );
  }
}
