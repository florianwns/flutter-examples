import 'package:flutter/material.dart';

import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = '/recipe-detail';

  AppBar buildAppBar(BuildContext context, Recipe recipe) {
    return AppBar(
      title: Text('${recipe.title}'),
    );
  }

  SizedBox buildImageHeader(BuildContext context, Recipe recipe) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Image.network(
        recipe.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context).settings.arguments;
    final appBar = buildAppBar(context, recipe);
    final imageHeader = buildImageHeader(context, recipe);
    final mediaQuery = MediaQuery.of(context);
    final double listViewHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height -
        imageHeader.height;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          imageHeader,
          SizedBox(
            height: listViewHeight,
            width: double.infinity,
            child: ListView(
              children: <Widget>[
                ExpansionTile(
                  title: Text('Ingredients'),
                  leading: Icon(Icons.assignment),
                  children: recipe.ingredients
                      .map(
                        (ingredient) => ListTile(
                          title: Text(ingredient),
                        ),
                      )
                      .toList(),
                ),
                ExpansionTile(
                  title: Text('Steps'),
                  leading: Icon(Icons.fastfood),
                  children: recipe.steps
                      .asMap()
                      .map((index, step) {
                        return MapEntry(
                          index,
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                '# ${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(step),
                          ),
                        ) ;
                      })
                      .values
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
