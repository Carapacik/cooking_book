import 'package:flutter/material.dart';
import 'package:recipebook/home_page.dart';
import 'package:recipebook/widgets/appbar_widget.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 78),
        child: AppBarWidget(),
      ),
      body: SingleChildScrollView(child: HomePage()),
    );
  }
}
