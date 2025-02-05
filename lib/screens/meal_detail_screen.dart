import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteMealsProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final isFavorite = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealsFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(isFavorite
                        ? 'Meal added to favorite'
                        : 'Meal no longer in favorite')));
              },
            icon: AnimatedSwitcher(
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                child: child,
              ),
              duration: Duration(milliseconds: 300),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
            ),
            SizedBox(height: 24),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            for (final step in meal.steps)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  textAlign: TextAlign.center,
                  step,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
