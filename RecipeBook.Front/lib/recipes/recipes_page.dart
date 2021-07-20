import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
