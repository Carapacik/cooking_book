import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/block/recipe_info.dart';
import 'package:recipebook/home/components/category_card.dart';
import 'package:recipebook/home/components/recipe_of_day.dart';
import 'package:recipebook/resources/icons.dart';
import 'package:recipebook/resources/images.dart';
import 'package:recipebook/resources/palette.dart';
import 'package:recipebook/service/api_service.dart';
import 'package:recipebook/widgets/contained_button.dart';
import 'package:recipebook/widgets/header_widget.dart';
import 'package:recipebook/widgets/outlined_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ApiService apiService;
  late bool isLoading;

  Future getRecipeOfDay() async {
    Response response;

    try {
      isLoading = true;

      response = await apiService.getRequest("/recipes?id=2");

      isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          // тут будет десериализвация json и запихивание в модель
          print(response.data.toString());
        });
      } else {
        print("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    apiService = ApiService();
    getRecipeOfDay();
    super.initState();
  }

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
        const HeaderWidget(),
        Padding(
          padding: const EdgeInsets.only(top: 211, left: 120, right: 120),
          child: Column(
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
              RecipeOfDayWidget(
                recipeInfo: RecipeInfo(
                  name: "Тыквенный супчик на кокосовом молоке",
                  description:
                      "Если у вас осталась тыква, и вы не знаете что с ней сделать, то это решение для вас! Ароматный, согревающий суп-пюре на кокосовом молоке. Можно даже в Пост! ",
                  imageUrl: CookingImages.recipeOfDay,
                  cookingTimeInMinutes: 35,
                  portionsCount: 2,
                  username: "@glazest",
                  likesCount: 310,
                ),
              ),
              const SizedBox(height: 150),
              Column(
                children: [
                  const Text(
                    "Поиск рецептов",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                      color: Palette.main,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Введите примерное название блюда, а мы по тегам найдем его",
                    style: TextStyle(
                      fontSize: 18,
                      color: Palette.mainLighten1,
                    ),
                  ),
                  const SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 73,
                        width: 716,
                        padding: const EdgeInsets.symmetric(
                            vertical: 28, horizontal: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Palette.shadowColor,
                                offset: Offset(0, 8),
                                blurRadius: 42,
                              )
                            ]),
                        child: TextField(
                          cursorColor: Palette.orange,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Palette.main,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Название блюда...",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Palette.main.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ButtonContainedWidget(
                        text: "Поиск",
                        width: 152,
                        height: 73,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
