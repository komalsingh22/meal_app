import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/provider/filterprovider.dart';
class Filters extends ConsumerWidget {
  const Filters({super.key});
   
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilter=ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      
      body: 
         Column(children: [
          SwitchListTile(
            onChanged: (ischecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, ischecked);
            },
            value: activefilter[Filter.glutenFree]!,
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            onChanged: (ischecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, ischecked);
            },
            value: activefilter[Filter.lactoseFree]!,
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            onChanged: (ischecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, ischecked);
            },
            value: activefilter[Filter.vegan]!,
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            onChanged: (ischecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetarain, ischecked);
            },
            value: activefilter[Filter.vegetarain]!,
            title: Text(
              'Vegetarain',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include vegetarain meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],),
      );
    
  }
}
