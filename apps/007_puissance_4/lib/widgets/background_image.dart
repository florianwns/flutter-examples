import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Image.asset(
      "assets/images/background_d1536.png",
      width: mediaQuery.size.width,
      height: mediaQuery.size.height,
      repeat: ImageRepeat.repeatY,
    );
  }
}
