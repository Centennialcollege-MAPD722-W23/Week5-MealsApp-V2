import 'package:flutter/material.dart';
import 'package:week4_demo/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function(Map<String, bool>) saveFilters;

  FiltersScreen(this.saveFilters);

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  var isVegeterian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'vegeterian': isVegeterian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(' Filter Your Meals'),
        ),
        Expanded(
            child: ListView(
          children: [
            SwitchListTile(
                title: const Text('Only Vegeterian Meals'),
                value: isVegeterian,
                onChanged: (newValue) {
                  setState(() {
                    isVegeterian = newValue;
                  });
                })
          ],
        ))
      ]),
    );
  }
}
