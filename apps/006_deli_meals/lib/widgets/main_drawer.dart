import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';


class MainDrawer extends StatelessWidget {
  final AppBar appBar;

  MainDrawer(this.appBar);

  Widget buildListTile(String title, IconData icon, Function callback) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: callback,
    );
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: appBar.preferredSize.height + paddingTop,
          width: double.infinity,
          padding: EdgeInsets.only(top: paddingTop),
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile(
          'Meals',
          Icons.restaurant,
          () => Navigator.of(context).pushReplacementNamed('/'),
        ),
        buildListTile(
          'Settings',
          Icons.settings,
          () => Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),          
        ),
      ],
    ));
  }
}
