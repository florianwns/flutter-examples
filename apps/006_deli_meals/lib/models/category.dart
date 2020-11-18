import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.blue,
  })  : assert(id != null),
        assert(title != null),
        assert(color != null);

  @override
  bool operator ==(other) {
    return id == other.id && title == other.title && color == other.color;
  }

  // we use XOR Operator for hashCode calculation
  int get hashCode => id.hashCode ^ title.hashCode ^ color.hashCode;
}
