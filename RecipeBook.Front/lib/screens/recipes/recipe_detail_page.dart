import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  final String recipeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeId.toString()),
      ),
      body: Text("Наш id = $recipeId"),
    );
  }
}
