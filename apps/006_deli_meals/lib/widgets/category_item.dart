import 'package:flutter/material.dart';

import '../models/category.dart';
import '../screens/recipes_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category) : assert(category != null);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      RecipesScreen.routeName,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.red,
      // Same radius than Container
      borderRadius: const BorderRadius.all(const Radius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.7), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // Same radius than InkWell
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
        ),
      ),
    );
  }
}
