import 'package:flutter/material.dart';

/// A game theme
class P4Theme {
  // Colors
  static const Color dropColor = Color.fromRGBO(215, 215, 215, 0.9);

  // Images
  static Image imgBackboard = Image.asset('assets/psd/backboard_d1550.png');
  static Image imgFrontboard = Image.asset('assets/psd/frontboard_d1550.png');
  static List<Image> imgsPionJaune = [
    Image.asset('assets/psd/pionjaune1_d200.png'),
    Image.asset('assets/psd/pionjaune2_d200.png'),
    Image.asset('assets/psd/pionjaune3_d200.png'),
    Image.asset('assets/psd/pionjaune4_d200.png'),
  ];
  static List<Image> imgsPionRed = [
    Image.asset('assets/psd/pionred1_d200.png'),
    Image.asset('assets/psd/pionred2_d200.png'),
    Image.asset('assets/psd/pionred3_d200.png'),
    Image.asset('assets/psd/pionred4_d200.png'),
  ];

  // Orignal images sizes
  static const double pionImgWidth = 200.0;
  static const double boardImgWidth = 1550.0;
}
