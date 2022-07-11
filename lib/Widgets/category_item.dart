import 'package:flutter/material.dart';
import 'package:pro_3/Screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final Color color;
  final String id;

  const CategoryItem({this.color, this.name, this.id});

  void selectCategory(BuildContext ctx) {
    Navigator.pushNamed(
      ctx,
      CategoryMealScreen.routeName,
      arguments: {'id': id, 'name': name},
    ).then((id) {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {selectCategory(context)},
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
