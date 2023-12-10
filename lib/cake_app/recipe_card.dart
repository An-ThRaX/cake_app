import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final List<dynamic> recipe;
  // if I would used final Function delete I would get an error when I would call 
  // the delete function on the onPressed property () -> 'Function' can't be 
  //assigned to the parameter type 'void Function()?'
  // VoidCallback delete or void Function() delete are the same
  final VoidCallback editRecipe;
  const RecipeCard({
    super.key, 
    // this.recipe will receive the data after we split
    required this.recipe,  
    required this.editRecipe});
  @override
  Widget build(BuildContext context) {
      return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                // recipe[1] == the 2nd element from the List recipe
                // 
                recipe[1],
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Center(
              child: Image(
                image: AssetImage(recipe[2].toString()),
                // recipe[2] == the 3rd element from the List recipe
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              // the widget is statless -> the delete function is created main where the
              // functions is called (because there it is a statefull widget and it can change data)
              onPressed: editRecipe,
              label: const Text('Editeaza reteta',),
              icon: const Icon(Icons.edit_note),
              style: const ButtonStyle(
                iconColor: MaterialStatePropertyAll(Colors.black54),
                foregroundColor: MaterialStatePropertyAll(Colors.black87),
              ),
            )
          ],
        ),
      ),
     );
  
  }
}