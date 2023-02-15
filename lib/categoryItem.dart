import 'package:flutter/material.dart';
import './category_mealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/category-maels', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {selectCategory(context)},
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 26),
        ),
      ),
    );
  }

  toList() {}
}
