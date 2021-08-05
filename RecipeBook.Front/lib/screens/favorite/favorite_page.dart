import 'package:flutter/material.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/header_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(currentSelectedPage: HeaderButtons.favorite),
          Text(
            "Избранное",
            style: Theme.of(context).textTheme.b72,
          ),
        ],
      ),
    );
  }
}
