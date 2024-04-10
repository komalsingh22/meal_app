

import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/data/mealdata.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/screen/selecteditem.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key,  required this.availableMeals});
 
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  void _selectedcategory(BuildContext context, Category category) {
    // filter the list contain certain items
    final filteredlist = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredlist),
      ),
    );
  }
  late AnimationController _animationController;
    @override
    void initState(){
      super.initState();
      _animationController=AnimationController(vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
      );
      _animationController.forward();
    }

    @override
    void dispose(){
      _animationController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context)  {
    
    return AnimatedBuilder(animation: _animationController, 
    child:  GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final item in availableCategories)
            GridItem(
              category: item,
              onselectedCategory: () {
                _selectedcategory(context,item);
              },
            )
        ],
      )
    ,
    builder: (context,child)=>  SlideTransition(
      position: 
        Tween(
          begin:const  Offset(0,0.3),
          end : const Offset(0, 0)
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
        ),
      
    child: child,)
    );
   
  }}
