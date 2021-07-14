import 'package:flutter/material.dart';
import 'package:recipebook/home/components/category_card.dart';
import 'package:recipebook/resources/icons.dart';
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
                  CategoryCardWidget(
                    iconPath: CookingIcons.menu,
                    title: "Простые блюда",
                    description:
                        "Время приготвления таких блюд не более 1 часа",
                  ),
                  CategoryCardWidget(
                    iconPath: CookingIcons.cook,
                    title: "Детское",
                    description:
                        "Самые полезные блюда которые можно детям любого возраста",
                  ),
                  CategoryCardWidget(
                    iconPath: CookingIcons.chef,
                    title: "От шеф-поваров",
                    description:
                        "Требуют умения, времени и терпения, зато как в ресторане",
                  ),
                  CategoryCardWidget(
                    iconPath: CookingIcons.confetti,
                    title: "На праздник",
                    description:
                        "Чем удивить гостей, чтобы все были сыты за праздничным столом",
                  ),
                ],
              ),
              const SizedBox(height: 157),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        width: 543,
                        height: 543,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(72),
                            bottomRight: Radius.circular(72),
                          ),
                        ),
                        child: Image.asset(
                          CookingImages.recipeOfDay,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 38),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(5),
                          ),
                        ),
                        child: const Text(
                          "@glazest",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Palette.orange,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ],
    );
  }
}
