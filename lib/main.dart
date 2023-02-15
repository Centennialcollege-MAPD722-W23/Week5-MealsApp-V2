import 'dart:math';

import 'package:flutter/material.dart';
import 'package:week4_demo/dummy_data.dart';
import './filter_screen.dart';
import './categoriesScreen.dart';
import 'category_mealsScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<Meal> selectedMeals = Dummy_Meals;

  Map<String, bool> filters = {
    'vegeterian': false,
  };

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      selectedMeals = Dummy_Meals.where((meal) {
        if (filterData['vegeterian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const CategoriesScreen(),
        '/category-maels': (context) => CategoryMeals(selectedMeals),
        '/filter-screen': (context) => FiltersScreen(setFilters),
      },
    );
  }
}
