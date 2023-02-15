import 'package:flutter/material.dart';
import './main_drawer.dart';
import './categoryItem.dart';
import 'package:week4_demo/dummy_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.title)),
      drawer: const MainDrawer(),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((category) =>
                CategoryItem(category.id, category.title, category.color))
            .toList(),
      ),
    );
  }
}
