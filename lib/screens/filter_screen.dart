import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widget/main_drawer.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();

          if (identifier == 'meals') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => TabsScreen(),
            ));
          }
        },
      ),
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilterMeal(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Glutte-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text('Only Include Gluted Free Meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactosFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilterMeal(Filter.lactosFree, isChecked);
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text('Only Include Lactose Free Meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilterMeal(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text('Only Include Vegetarian Meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilterMeal(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text('Only Include Vegan Meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          )
        ],
      ),
    );
  }
}
