import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: Text('Your Filters'));
    
    return Scaffold(
      appBar:appBar,
      drawer: MainDrawer(appBar),
      body: Text('test'),
    );
  }
}
