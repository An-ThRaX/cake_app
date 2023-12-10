// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_net_ninja_tutorial/quotes/quote_card.dart';
import 'package:flutter_net_ninja_tutorial/cake_app/utils.dart';

void main() => runApp(MaterialApp(
      home: RecipeList(),
    ));

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List <List<dynamic>> fileWithRecipes = [];

  void _loadCSV() async {
     final fileCSV = await rootBundle.loadString("assets/book2.csv");
     List<List<dynamic>> listData = 
     const CsvToListConverter().convert(fileCSV);
     setState(() {
      fileWithRecipes = listData;
     });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _loadCSV();
    });
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: Text(
          'Awesome Quotes',
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: fileWithRecipes.length,
        itemBuilder: (_, index){
        // in recipe save the first entry from fileWithRecipes after we split it
        // fileWithRecipes[index] == each row from the csv file
        // fileWithRecipes[index][0] == in the first place, we get the recipe as a 
        // solo string with index 0; therefore we split it into individual elements
        final recipe = fileWithRecipes[index][0].split(';');
        // call the RecipeCard constructor which returns a Card with info regarding
        // each recipe
        return RecipeCard(recipe: recipe, editRecipe: (){});
        }
      ),
    );
  }
}
