import 'package:flutter/material.dart';

import '../widget/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArguments['id'];
      categoryTitle = routeArguments['title'];
      displayedMeals = widget._availableMeals.where((meal) {
        return meal.categoryIds.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _delectItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals.elementAt(index).id,
            title: displayedMeals.elementAt(index).title,
            imageUrl: displayedMeals.elementAt(index).imageUrl,
            duration: displayedMeals.elementAt(index).duration,
            complexity: displayedMeals.elementAt(index).complexity,
            affordability: displayedMeals.elementAt(index).affordability,
            //delectItem: _delectItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
