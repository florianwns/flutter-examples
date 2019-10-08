import 'package:flutter/material.dart';

import '../models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  RecipeItem(this.recipe) : assert(recipe != null);

  void selectRecipe() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectRecipe,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                  child: Image.network(
                    recipe.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
