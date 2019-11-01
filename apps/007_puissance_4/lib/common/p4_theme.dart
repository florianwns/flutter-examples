import 'package:flutter/material.dart';

/// A game theme
class P4Theme {
  /// Light column color
  static const Color lightColumnColor = Color.fromRGBO(215, 215, 215, 0.9);

  /// Score bar yellow color
  static const Color scoreBarYellowColor = Color.fromRGBO(253, 196, 84, 1);

  /// Score bar red color
  static const Color scoreBarRedColor = Color.fromRGBO(236, 97, 87, 1);

  /// Score bar image
  static Image scoreBarImg = Image.asset('assets/images/scorebar_d640.png');

  /// Backboard image
  static Image backboardImg = Image.asset('assets/images/backboard_d1550.png');

  /// Frontboard image
  static Image frontboardImg =
      Image.asset('assets/images/frontboard_d1550.png');

  /// Yellow pion images
  static List<Image> yellowPionImgs = [
    Image.asset('assets/images/pionjaune1_d200.png'),
    Image.asset('assets/images/pionjaune2_d200.png'),
    Image.asset('assets/images/pionjaune3_d200.png'),
    Image.asset('assets/images/pionjaune4_d200.png'),
  ];

  /// Red pion images
  static List<Image> redPionImgs = [
    Image.asset('assets/images/pionred1_d200.png'),
    Image.asset('assets/images/pionred2_d200.png'),
    Image.asset('assets/images/pionred3_d200.png'),
    Image.asset('assets/images/pionred4_d200.png'),
  ];

  /// Pion image width
  static const double pionImgWidth = 200.0;

  /// Board image width
  static const double boardImgWidth = 1550.0;
  
  /// Score bar image width
  static const double scoreBarImgWidth = 640.0;
  
  /// Score bar image height
  static const double scoreBarImgHeight = 159.0;
  
  /// Score bar horizontal padding
  static const double scoreBarHorizontalPadding = 90.0;
  
  /// Score bar vertical padding
  static const double scoreBarVerticalPadding = 45.0;
}
