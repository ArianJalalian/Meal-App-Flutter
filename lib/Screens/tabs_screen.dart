import 'package:flutter/material.dart';
import 'package:pro_3/Models/meal.dart';
import 'package:pro_3/Screens/categories_screen.dart';
import 'package:pro_3/Screens/favourites_screen.dart';
import 'package:pro_3/Widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  final Map<String, bool> filters;
  TabsScreen(
    this.favouriteMeals,
    this.filters,
  );
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  initState() {
    _pages = [
      {'page': CategoriesScreen(), 'name': 'Categories'},
      {
        'page': FavouritesScreen(widget.favouriteMeals, widget.filters),
        'name': 'Favourites'
      },
    ];
    super.initState();
  }

  int _selectedIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
      print(widget.favouriteMeals.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['name']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: _selectTab,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: _pages[0]['name'],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: _pages[1]['name'],
          ),
        ],
      ),
      body: _pages[_selectedIndex]['page'],
    );
  }
}
