import 'package:flutter/material.dart';

/// A game theme
class P4Theme {
  // Colors
  static const Color dropColor = Color.fromRGBO(215, 215, 215, 0.9);

  static Image imgBackboard = Image.asset('assets/images/backboard_d1550.png');
  static Image imgFrontboard =
      Image.asset('assets/images/frontboard_d1550.png');
  static List<Image> imgsPionJaune = [
    Image.asset('assets/images/pionjaune1_d200.png'),
    Image.asset('assets/images/pionjaune2_d200.png'),
    Image.asset('assets/images/pionjaune3_d200.png'),
    Image.asset('assets/images/pionjaune4_d200.png'),
  ];
  static List<Image> imgsPionRed = [
    Image.asset('assets/images/pionred1_d200.png'),
    Image.asset('assets/images/pionred2_d200.png'),
    Image.asset('assets/images/pionred3_d200.png'),
    Image.asset('assets/images/pionred4_d200.png'),
  ];

  // Orignal images sizes
  static const double pionImgWidth = 200.0;
  static const double boardImgWidth = 1550.0;
}
