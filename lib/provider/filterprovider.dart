

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/mealsprovider.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  vegetarain
}
class FilterNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterNotifier():super({
    Filter.glutenFree:false,
    Filter.lactoseFree:false,
    Filter.vegan:false,
    Filter.vegetarain:false,
  });

  void setFilters(Map<Filter, bool> chosenfilter){
    state=chosenfilter;
  }
  void setFilter(Filter filter,bool isActive){
    state= {...state,
    filter:isActive
    };
  }
}

final filtersProvider=StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref) => 
FilterNotifier(),
);

final filterMealProvider=Provider((ref){
  final meals =ref.watch(mealsProvider);
  final activefilter=ref.watch(filtersProvider);
  return meals.where((meal) {
      if (activefilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activefilter[Filter.vegetarain]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
});