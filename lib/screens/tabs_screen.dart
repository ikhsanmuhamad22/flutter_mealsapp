import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> favorites = [];
  int _selectedPageIndex = 0;

  void _showNotifSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _addToggleToFavorite(Meal meal) {
    final isFavorite = favorites.contains(meal);

    if (isFavorite) {
      setState(() {
        _showNotifSnackBar('Meal no longer in favorite');
        favorites.remove(meal);
      });
    } else {
      setState(() {
        _showNotifSnackBar('Meal is add to favorite');
        favorites.add(meal);
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _addToggleToFavorite,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favorites,
        onToggleFavorite: _addToggleToFavorite,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ]),
    );
  }
}
