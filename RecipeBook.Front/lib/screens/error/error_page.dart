import 'package:flutter/material.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/header_widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    this.errorMessage,
    Key? key,
  }) : super(key: key);

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
                  "Ошибка",
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
