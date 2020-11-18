import 'package:deli_meals/widgets/recipe_item.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/recipe.dart';
import '../widgets/recipe_item.dart';

class RecipesScreen extends StatelessWidget {
  static const routeName = '/recipes';

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    final List<Recipe> recipes = Meals.recipes
        .where((recipe) => recipe.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return RecipeItem(
            recipe: recipes[index],
            category: category,
          );
        },
        itemCount: recipes.length,
      ),
    );
  }
}
