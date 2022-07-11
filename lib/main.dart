import 'package:flutter/material.dart';
import 'package:pro_3/Screens/category_meal_screen.dart';
import 'package:pro_3/Screens/filters_screen.dart';
import 'package:pro_3/Screens/meal_detail_screen.dart';
import 'package:pro_3/Screens/tabs_screen.dart';
import 'package:pro_3/dummy-data.dart';
import './Models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favouriteMeals = [];

  final meals = DUMMY_MEALS;

  List<Meal> availableMeals = DUMMY_MEALS;

  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  void saveFilters(Map<String, bool> filters) {
    setState(() {
      this.filters = filters;
      availableMeals = meals.where(
        (meal) {
          if (filters['gluten'] && !meal.isGlutenFree) return false;
          if (filters['vegan'] && !meal.isVegan) return false;
          if (filters['lactose'] && !meal.isLactoseFree) return false;
          if (filters['vegetarian'] && !meal.isVegetarian) return false;
          return true;
        },
      ).toList();
    });
  }

  void toggleFavourites(String mealId) {
    final int index = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index == -1)
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    else
      setState(() {
        favouriteMeals.removeAt(index);
      });
  }

  bool isFave(String mealId) {
    return favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (_) => TabsScreen(favouriteMeals, filters),
        CategoryMealScreen.routeName: (_) => CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(toggleFavourites, isFave),
        FiltersScreen.routeName: (_) => FiltersScreen(saveFilters, filters),
      },
      onUnknownRoute: (context) {
        return MaterialPageRoute(
            builder: (context) => TabsScreen(favouriteMeals, filters));
      },
    );
  }
}
