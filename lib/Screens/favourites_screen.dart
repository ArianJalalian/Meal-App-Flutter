import 'package:flutter/material.dart';
import 'package:pro_3/Widgets/meal_item.dart';
import '../Models/meal.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favs;
  final Map<String, bool> filters;
  FavouritesScreen(this.favs, this.filters);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    List<Meal> _availableFavs = widget.favs.where(
      (meal) {
        if (widget.filters['gluten'] && !meal.isGlutenFree) return false;
        if (widget.filters['vegan'] && !meal.isVegan) return false;
        if (widget.filters['lactose'] && !meal.isLactoseFree) return false;
        if (widget.filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      },
    ).toList();
    if (_availableFavs.isEmpty)
      return Center(
        child: Text('You don\'t have any favourite meals - add some !'),
      );
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: _availableFavs.elementAt(index).id,
          affordability: _availableFavs.elementAt(index).affordability,
          duration: _availableFavs.elementAt(index).duration,
          name: _availableFavs.elementAt(index).name,
          imageUrl: _availableFavs.elementAt(index).imageUrl,
          path: _availableFavs.elementAt(index).path,
          complexity: _availableFavs.elementAt(index).complexity,
        );
      },
      itemCount: widget.favs.length,
    );
  }
}
