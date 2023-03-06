import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/resources/palette.dart';
import 'package:recipe_book_flutter/theme.dart';
import 'package:recipe_book_flutter/widgets/header_widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({this.errorMessage, super.key});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                Text(
                  'Ошибка',
                  style: Theme.of(context).textTheme.b72.copyWith(
                        color: Palette.red,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                if (errorMessage != null) Text(errorMessage!),
              ],
            ),
          )
        ],
      ),
    );
  }
}
