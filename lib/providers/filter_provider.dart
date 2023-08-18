import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactosFree, vegetarianFree, veganFree }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactosFree: false,
          Filter.veganFree: false,
          Filter.vegetarianFree: false,
        });
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;  
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());
