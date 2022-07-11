import 'package:flutter/material.dart';
import 'package:pro_3/dummy-data.dart';

class MealDetailScreen extends StatefulWidget {
  static const String routeName = '/meal-detail';
  final Function toggleFav;
  final Function isFav;
  MealDetailScreen(this.toggleFav, this.isFav);
  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget _sectionTitleBuilder(BuildContext context, String title) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  int _stepNum = 1;
  int _stepNumber() {
    return _stepNum++;
  }

  @override
  Widget build(BuildContext context) {
    final String _id = ModalRoute.of(context).settings.arguments;
    final _selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == _id);
    IconData _floatingIcon = widget.isFav(_id) ? Icons.star : Icons.star_border;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(_floatingIcon),
        onPressed: () {
          setState(
            () {
              if (widget.isFav(_id))
                _floatingIcon = Icons.star;
              else {
                _floatingIcon = Icons.star_border;
              }
              widget.toggleFav(_id);
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text(_selectedMeal.name),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              _selectedMeal.path,
              fit: BoxFit.cover,
            ),
          ),
          _sectionTitleBuilder(context, "Ingredients"),
          ..._selectedMeal.ingredients.map(
            (ingredient) {
              return Card(
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 70,
                ),
                color: Theme.of(context).accentColor,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  child: Center(
                      child: Text(
                    ingredient,
                    softWrap: true,
                  )),
                ),
              );
            },
          ).toList(),
          _sectionTitleBuilder(context, "Steps :"),
          ..._selectedMeal.steps.map(
            (step) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text("# ${_stepNumber()}"),
                ),
                title: Text(step),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
