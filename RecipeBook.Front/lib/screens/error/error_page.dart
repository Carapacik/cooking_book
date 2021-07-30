import 'package:flutter/material.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/header_widget.dart';

class ConnectionLostPage extends StatelessWidget {
  const ConnectionLostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Center(
            child: Text(
              "Ошибка",
              style: Theme.of(context).textTheme.b72.copyWith(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
