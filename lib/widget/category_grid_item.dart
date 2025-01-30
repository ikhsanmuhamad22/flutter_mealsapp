import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class Categories extends StatelessWidget {
  const Categories(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function(BuildContext context, Category category) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectCategory(context, category),
      hoverColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.6),
            category.color.withOpacity(0.22)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
