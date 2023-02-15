import 'package:flutter/material.dart';
import './mealItem.dart';
import 'meal.dart';

class CategoryMeals extends StatelessWidget {
  late String id;
  late String title;

  List<Meal> selectedMealsFromMain;
  CategoryMeals(this.selectedMealsFromMain);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    id = routeArgs['id']!;
    title = routeArgs['title']!;

    final mealsInCategory = selectedMealsFromMain.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              mealsInCategory[index].title,
              mealsInCategory[index].imageUrl,
              mealsInCategory[index].duration,
            );
          },
          itemCount: mealsInCategory.length,
        ));
  }
}
