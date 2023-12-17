// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_net_ninja_tutorial/cake_app/recipe_card.dart';

import 'app_bar.dart';
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
  List<List<dynamic>> fileWithRecipes = [];
  String csvFilePath = 'assets/book2.csv';
  void _loadCSV() async {
    final fileCSV = await rootBundle.loadString(csvFilePath);
    List<List<dynamic>> listData = const CsvToListConverter().convert(fileCSV);
    setState(() {
      fileWithRecipes = listData;
    });
  }

  // void editRecipe(String filePath,
  //     {required int rowIndex,
  //     required String columnName,
  //     required String newValue}) async {
  //   final fileCSV = await rootBundle.loadString(csvFilePath);
  //   List<List<dynamic>> listData = const CsvToListConverter().convert(fileCSV);
  //   File file = await File(csvFilePath);
  // }
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _loadCSV();
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 247, 255),
      appBar: CustomAppBar(),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            groupAlignment: groupAlignment,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: labelType,
            leading: showLeading
                ? FloatingActionButton(
                    elevation: 0,
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  )
                : const SizedBox(),
            trailing: showTrailing
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  )
                : const SizedBox(),
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                  icon: Icon(Icons.folder_copy), label: textStyling('Ciorbe')),
              NavigationRailDestination(
                  icon: Icon(Icons.folder_copy), label: textStyling('Ciorbe')),
              NavigationRailDestination(
                  icon: Icon(Icons.folder_copy), label: textStyling('Ciorbe')),
            ],
          ),
          Flexible(
            // ListView is scrollable and doesnt overflow the screen
            child: ListView(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: fileWithRecipes.length,
                    itemBuilder: (_, index) {
                      // in recipe save the first entry from fileWithRecipes after we split it
                      // fileWithRecipes[index] == each row from the csv file
                      // fileWithRecipes[index][0] == in the first place, we get the recipe as a
                      // solo string with index 0; therefore we split it into individual elements
                      final recipe = fileWithRecipes[index][0].split(';');
                      // call the RecipeCard constructor which returns a Card with info regarding
                      // each recipe
                      return RecipeCard(recipe: recipe, editRecipe: () {});
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
