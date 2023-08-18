import 'package:flutter/material.dart';

import 'package:meals/providers/favourite_meal_provider.dart';
import 'package:meals/providers/meals_providers.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/filter_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.veganFree: false,
  Filter.vegetarianFree: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPage = 0;

  // Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (context) => const FilterScreen(),
      ));
    }
    // else {
    //   Navigator.of(context).pop();
    // }
  }

  void _selectPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final activeFilters = ref.watch(filterProvider);
    final awailableMeals = meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.veganFree]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filter.vegetarianFree]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      awailableMeals: awailableMeals,
    );
    var activePageTitle = 'Categories';
    if (selectedPage == 1) {
      final favouriteMeal = ref.watch(favouriteMealProvider);
      activePageTitle = 'Favourite';
      activePage = MealsScreen(
        meals: favouriteMeal,
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(onSelect: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite')
          ]),
    );
  }
}
