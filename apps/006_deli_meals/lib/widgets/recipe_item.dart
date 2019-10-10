import 'package:deli_meals/models/category.dart';
import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../screens/recipe_detail_screen.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final Category category;

  RecipeItem({
    @required this.recipe,
    @required this.category,
  })  : assert(recipe != null),
        assert(category != null);

  void selectRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(
      RecipeDetailScreen.routeName,
      arguments: recipe,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  () => selectRecipe(context),
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
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: category.color.withOpacity(0.8),
                      borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        bottomLeft: const Radius.circular(10),
                      ),
                    ),
                    width: 220,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      recipe.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${recipe.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(recipe.complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(recipe.affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
