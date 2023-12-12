// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_net_ninja_tutorial/quotes/quote_card.dart';
import 'package:flutter_net_ninja_tutorial/cake_app/utils.dart';
import 'package:file_picker/file_picker.dart';

import 'recipe_card.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart';

void main() => runApp(MaterialApp(
      home: RecipeList(),
    ));

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<List<dynamic>> fileWithRecipes = [];

  void _loadCSV() async {
    var csvFile = await rootBundle.loadString("assets/book2.csv");
    List<List<dynamic>> csvData = const CsvToListConverter().convert(csvFile);
    setState(() {
      fileWithRecipes = csvData;
    });
  }

  generateCsv() async {
    var csvFile = await rootBundle.loadString("assets/book2.csv");
    List<List<dynamic>> csvFileList =
        const CsvToListConverter().convert(csvFile);
    String csvData = ListToCsvConverter().convert(csvFileList);
    final path = "assets/book1.csv";
    final File file = File(path);
    await file.writeAsString(csvData);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LoadCsvDataScreen(path: path);
        },
      ),
    );
  }

  LoadCsvFromStorate() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv'],
      type: FileType.custom,
    );
    String? path = result?.files.first.path;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LoadCsvDataScreen(path: path);
        },
      ),
    );
  }

  Future<List<List<dynamic>>> loadingCsvData

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
          itemBuilder: (_, index) {
            // in 'recipe' save the first entry from fileWithRecipes after we split it
            // fileWithRecipes[index] == each row from the csv file
            // fileWithRecipes[index][0] == in the first place, we get the recipe as a
            // solo string with index 0; therefore we split it into individual elements
            final recipe = fileWithRecipes[index][0].split(';');
            // call the RecipeCard constructor which returns a Card with info regarding
            // each recipe
            return RecipeCard(recipe: recipe, editRecipe: () {});
          }),
    );
  }
}
