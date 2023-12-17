import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'recipe_card.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  State<CustomGridView> createState() => CustomGridViewState();
}

class CustomGridViewState extends State<CustomGridView> {
  List<List<dynamic>> fileWithRecipes = [];
  String csvFilePath = 'assets/book2.csv';
  void _loadCSV() async {
    final fileCSV = await rootBundle.loadString(csvFilePath);
    List<List<dynamic>> listData = const CsvToListConverter().convert(fileCSV);
    setState(() {
      fileWithRecipes = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: fileWithRecipes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 2),
        itemBuilder: (context, index) {
          final recipe = fileWithRecipes[index][0].split(';');
          return RecipeCard(recipe: recipe, editRecipe: () {});
        });
  }
}
