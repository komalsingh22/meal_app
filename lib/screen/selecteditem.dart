import 'package:meal_app/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screen/meal_deteail_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title , required this.meals});
   final String ? title;
   final List<Meal> meals;
  

void _selectedmeal( BuildContext context, Meal meal){
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealDetailScreen(meal: meal,)));
}
  @override
  Widget build(BuildContext context) {
    Widget ? content;
    if(meals.isEmpty){
      content= Center(child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('NO items is present here!', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground
          )),
          const  SizedBox(height: 10,),
          Text('Try to selecting other category!',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground
          ))
        ],
      ),);
    }
    else{
      content=ListView.builder(
        itemCount: meals.length,
        itemBuilder:(ctx,index)=>MealItem(meal: meals[index],
        onselectedMeal:(meal,contex){_selectedmeal(context, meal);} 
          
        ) );
    }
    if(title==null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content
    ); 
  }
}