import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  final Function saveFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.saveFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  Widget _buildListTileSwitch(
      String title, bool currentValue, Function updateState, String desc) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateState,
      subtitle: Text(desc),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  void initState() {
    _isGlutenFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.saveFilters(
              {
                'gluten': _isGlutenFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
                'lactose': _isLactoseFree,
              },
            );
            Navigator.of(context).pop();
          },
        ),
        title: Text('Filters'),
      ),
      body: ListView(
        children: [
          _buildListTileSwitch(
            'Gluten-Free',
            _isGlutenFree,
            (newValue) {
              setState(
                () {
                  _isGlutenFree = newValue;
                },
              );
            },
            'Include Gluten-Free meals',
          ),
          _buildListTileSwitch(
            'Lactose-Free',
            _isLactoseFree,
            (newValue) {
              setState(
                () {
                  _isLactoseFree = newValue;
                },
              );
            },
            'Include Lactose-Free meals',
          ),
          _buildListTileSwitch(
            'Vegetarian',
            _isVegetarian,
            (newValue) {
              setState(
                () {
                  _isVegetarian = newValue;
                },
              );
            },
            'Include Vegetarian meals',
          ),
          _buildListTileSwitch(
            'Vegan',
            _isVegan,
            (newValue) {
              setState(
                () {
                  _isVegan = newValue;
                },
              );
            },
            'Include Vegan meals',
          ),
        ],
      ),
    );
  }
}
