import 'package:flutter/material.dart';

/// A game theme
class P4Theme {
  // Colors
  static const Color dropColor = Color.fromRGBO(215, 215, 215, 0.9);
  static const Color scoreBarYellowColor = Color.fromRGBO(253, 196, 84, 1);
  static const Color scoreBarRedColor = Color.fromRGBO(236, 97, 87, 1);

  static Image scoreBarImg = Image.asset('assets/images/scorebar_d640.png');
  static Image backboardImg = Image.asset('assets/images/backboard_d1550.png');
  static Image frontboardImg =
      Image.asset('assets/images/frontboard_d1550.png');
  static List<Image> yellowPionImgs = [
    Image.asset('assets/images/pionjaune1_d200.png'),
    Image.asset('assets/images/pionjaune2_d200.png'),
    Image.asset('assets/images/pionjaune3_d200.png'),
    Image.asset('assets/images/pionjaune4_d200.png'),
  ];
  static List<Image> redPionImgs = [
    Image.asset('assets/images/pionred1_d200.png'),
    Image.asset('assets/images/pionred2_d200.png'),
    Image.asset('assets/images/pionred3_d200.png'),
    Image.asset('assets/images/pionred4_d200.png'),
  ];

  // Orignal images sizes
  static const double pionImgWidth = 200.0;
  static const double boardImgWidth = 1550.0;
  static const double scoreBarImgWidth = 640.0;
  static const double scoreBarImgHeight = 159.0;
  static const double scoreBarHorizontalPadding = 90.0;
  static const double scoreBarVerticalPadding = 45.0;
}
