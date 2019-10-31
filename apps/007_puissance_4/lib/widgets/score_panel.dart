
import 'package:flutter/material.dart';

import '../common/p4_theme.dart';
import './score_bar.dart';


class ScorePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final ratio = screenWidth / P4Theme.scoreBarImgWidth;
    final horizontalPadding = ratio * P4Theme.scoreBarHorizontalPadding;
    final verticalPadding = ratio * P4Theme.scoreBarVerticalPadding;

    return Container(
      width: P4Theme.scoreBarImgWidth * ratio,
      height: P4Theme.scoreBarImgHeight * ratio,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: ScoreBar(),
          ),
          P4Theme.scoreBarImg,
        ],
      ),
    );
  }
}
