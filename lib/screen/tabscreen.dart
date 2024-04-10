import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favoriteprovider.dart';
import 'package:meal_app/screen/categories.dart';
import 'package:meal_app/screen/filters.dart';
import 'package:meal_app/screen/selecteditem.dart';
import 'package:meal_app/provider/filterprovider.dart';
import 'package:meal_app/widgets/main_drawer.dart';


const kinitialfilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarain: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedpageindex = 0;
  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }


  void _setScreenIdentifer(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
       await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const Filters(),
        ),
      );
     
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
   
    final availablemeals = ref.watch(filterMealProvider);

    Widget activeScreen = CategoriesScreen(
      availableMeals: availablemeals,
    );
    var activetitle = 'Categories';
    if (_selectedpageindex == 1) {
      final favoritemeal = ref.watch(favoriteMealProvider);
      activeScreen = MealsScreen(
        meals: favoritemeal,
      );
      activetitle = "Yours Favorites ";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      drawer: MainDrawer(onselectedScreen: _setScreenIdentifer),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedpageindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
