import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String _data;

  TextOutput(this._data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child : Text(
        _data,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
