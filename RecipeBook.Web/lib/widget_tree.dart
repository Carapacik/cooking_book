import 'package:flutter/material.dart';
import 'package:recipebook/home/home_page.dart';
import 'package:recipebook/widgets/header_widget.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: HomePage()),
    );
  }
}
