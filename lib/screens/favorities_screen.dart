import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritiesMeals;
  FavoritesScreen(this.favoritiesMeals);
  @override
  Widget build(BuildContext context) {
    if (favoritiesMeals.isEmpty) {
      return Center(
        child: Text('You have no favorities...yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoritiesMeals.elementAt(index).id,
            title: favoritiesMeals.elementAt(index).title,
            imageUrl: favoritiesMeals.elementAt(index).imageUrl,
            duration: favoritiesMeals.elementAt(index).duration,
            complexity: favoritiesMeals.elementAt(index).complexity,
            affordability: favoritiesMeals.elementAt(index).affordability,
            //delectItem: _delectItem,
          );
        },
        itemCount: favoritiesMeals.length,
      );
    }
  }
}
