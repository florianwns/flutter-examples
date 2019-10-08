import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/recipes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Deli Meals',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor:
              const Color.fromRGBO(255, 254, 229, 1), // Background Color
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: const TextStyle(
                  color: const Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: const TextStyle(
                  color: const Color.fromRGBO(20, 51, 51, 1),
                ),
                title: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        initialRoute: CategoriesScreen.routeName, // default is '/'
        routes: {
          CategoriesScreen.routeName: (context) => CategoriesScreen(),
          RecipesScreen.routeName: (context) => RecipesScreen(),
        });
  }
}
