import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/mealdata.dart';

final mealsProvider=Provider((ref) {
  return dummyMeals;
});