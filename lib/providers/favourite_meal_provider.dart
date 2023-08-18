import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);
  bool toggleMealFaovourite(Meal meal) {
    final mealFaouvorite = state.contains(meal);
    if (mealFaouvorite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealNotifier();
  },
);
