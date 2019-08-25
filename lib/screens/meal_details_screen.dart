import 'package:flutter/material.dart';

import '../data.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function _toggleFavorite;
  final Function _isMealFavorite;

  MealDetailsScreen(this._toggleFavorite, this._isMealFavorite);

  static const String routeName = '/meal-details-screen';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final _selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                _selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(
              ListView.builder(
                itemCount: _selectMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(_selectMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(ListView.builder(
              itemCount: _selectMeal.steps.length,
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '# ${index + 1}',
                      ),
                    ),
                    title: Text(
                      _selectMeal.steps[index],
                    ),
                  ),
                  Divider()
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isMealFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => _toggleFavorite(mealId),
      ),
    );
  }

  Container _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Container _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
