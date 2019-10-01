import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final VoidCallback _onPressed;

  TextControl(this._onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: _onPressed,
      textColor: Colors.white,
      color: Colors.blue,
      child: Text("Click Me !"),
    );
  }
}
