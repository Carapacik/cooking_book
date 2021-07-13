import 'package:flutter/material.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
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
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          alignment: Alignment.topRight,
          width: 602,
          height: 800,
          child: Image.asset(
            CookingImages.homeBackground,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 211, left: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 688,
                child: Text(
                  "Готовь и делись рецептами",
                  style: TextStyle(
                    color: Palette.main,
                    fontSize: 72,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: 566,
                child: Text(
                  "Никаких кулинарных книг и блокнотов! Храни все любимые рецепты в одном месте.",
                  style: TextStyle(
                    color: Palette.mainLighten1,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 42),
              Row(),
            ],
          ),
        ),
      ],
    );
  }
}
