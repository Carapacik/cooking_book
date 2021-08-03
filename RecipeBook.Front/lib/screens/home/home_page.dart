import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/route.dart';
import 'package:recipebook/screens/home/components/recipe_of_day.dart';
import 'package:recipebook/theme.dart';
import 'package:recipebook/widgets/category_card.dart';
import 'package:recipebook/widgets/components/header_buttons.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/outlined_button.dart';
import 'package:recipebook/widgets/search_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SvgPicture.asset(
              CookingImages.wave1,
              color: Palette.wave,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1000),
              child: SvgPicture.asset(
                CookingImages.wave2,
                color: Palette.wave,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              width: 602,
              height: 800,
              child: Image.asset(CookingImages.homeBackground),
            ),
            const HeaderWidget(currentSelectedPage: HeaderButtons.home),
            Padding(
              padding: const EdgeInsets.only(top: 211, left: 120, right: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 688,
                    child: Text(
                      "Готовь и делись рецептами",
                      style: Theme.of(context).textTheme.b72,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 566,
                    child: Text(
                      "Никаких кулинарных книг и блокнотов! Храни все любимые рецепты в одном месте.",
                      style: Theme.of(context).textTheme.r18,
                    ),
                  ),
                  const SizedBox(height: 42),
                  Row(
                    children: [
                      ButtonContainedWidget(
                        icon: Icons.add,
                        padding: 18,
                        text: "Добавить рецепт",
                        width: 278,
                        height: 60,
                        onPressed: () {
                          context.vxNav.push(Uri.parse(RecipeRoutes.addRecipeRoute));
                        },
                      ),
                      const SizedBox(width: 24),
                      ButtonOutlinedWidget(
                        text: "Войти",
                        width: 216,
                        height: 60,
                        onPressed: null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 352),
                  Text(
                    "Умная сортировка по тегам",
                    style: Theme.of(context).textTheme.b42,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 700,
                    child: Text(
                      "Добавляй рецепты и указывай наиболее популярные теги. Это позволит быстро находить любые категории.",
                      style: Theme.of(context).textTheme.r18,
                    ),
                  ),
                  const SizedBox(height: 42),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCardWidget(
                        iconPath: CookingIcons.menu,
                        title: "Простые блюда",
                        description: "Время приготвления таких блюд не более 1 часа",
                      ),
                      CategoryCardWidget(
                        iconPath: CookingIcons.cook,
                        title: "Детское",
                        description: "Самые полезные блюда которые можно детям любого возраста",
                      ),
                      CategoryCardWidget(
                        iconPath: CookingIcons.chef,
                        title: "От шеф-поваров",
                        description: "Требуют умения, времени и терпения, зато как в ресторане",
                      ),
                      CategoryCardWidget(
                        iconPath: CookingIcons.confetti,
                        title: "На праздник",
                        description: "Чем удивить гостей, чтобы все были сыты за праздничным столом",
                      ),
                    ],
                  ),
                  const SizedBox(height: 157),
                  const RecipeOfDayWidget(),
                  const SizedBox(height: 150),
                  Column(
                    children: [
                      Text(
                        "Поиск рецептов",
                        style: Theme.of(context).textTheme.b42,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Введите примерное название блюда, а мы по тегам найдем его",
                        style: Theme.of(context).textTheme.r18.copyWith(color: Palette.main),
                      ),
                      const SizedBox(height: 64),
                      Center(child: SearchWidget(width: 716)),
                      const SizedBox(height: 24),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
