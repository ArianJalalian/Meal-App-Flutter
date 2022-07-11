import 'package:flutter/material.dart';
import 'package:pro_3/Widgets/meal_item.dart';
import '../Models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  final List<Meal> meals;
  CategoryMealScreen(this.meals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final _id = routArgs['id'];
    final _categoryMeals =
        widget.meals.where((meal) => meal.categories.contains(_id)).toList();
    final _name = routArgs['name'];
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _categoryMeals.elementAt(index).id,
            affordability: _categoryMeals.elementAt(index).affordability,
            duration: _categoryMeals.elementAt(index).duration,
            name: _categoryMeals.elementAt(index).name,
            imageUrl: _categoryMeals.elementAt(index).imageUrl,
            path: _categoryMeals.elementAt(index).path,
            complexity: _categoryMeals.elementAt(index).complexity,
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
