import 'package:flutter/material.dart';

import './screens/recipes_screen.dart';
import './screens/recipe_detail_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.teal,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1), // Background Color
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
      // default is '/'
      initialRoute: HomeScreen.routeName,
      routes: {
        '/': (context) => HomeScreen(),
        RecipesScreen.routeName: (context) => RecipesScreen(),
        RecipeDetailScreen.routeName: (context) => RecipeDetailScreen(),
      },
      /*
        onGenerateRoute: (RouteSettings settings){ // pass in this method if routeName does'nt match
          print(settings);
          return MaterialPageRoute(builder: (context) => CategoriesScreen(),);
        }, 
      */
      onUnknownRoute: (RouteSettings settings) {
        // 404
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      },
    );
  }
}
