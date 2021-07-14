import 'package:flutter/material.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/outlined_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
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
          padding: const EdgeInsets.only(top: 211, left: 120, right: 120),
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
              Row(
                children: [
                  ButtonContainedWidget(
                    text: "Добавить рецепт",
                    width: 278,
                    height: 60,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 24),
                  ButtonOutlinedWidget(
                    text: "Войти",
                    width: 216,
                    height: 60,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 113),
              const Text(
                "Умная сортировка по тегам",
                style: TextStyle(
                  color: Palette.main,
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: 700,
                child: Text(
                  "Добавляй рецепты и указывай наиболее популярные теги. Это позволит быстро находить любые категории.",
                  style: TextStyle(
                    color: Palette.mainLighten1,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 352),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCardWidget(),
                  CategoryCardWidget(),
                  CategoryCardWidget(),
                  CategoryCardWidget(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 271,
      width: 278,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Palette.shadowColor,
            offset: Offset(0, 16),
            blurRadius: 72,
          )
        ],
      ),
    );
  }
}
